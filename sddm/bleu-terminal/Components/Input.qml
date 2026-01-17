import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property alias text: input.text
    property alias echoMode: input.echoMode
    property alias inputMethodHints: input.inputMethodHints
    property string promptText: ">"
    property string placeholderText: ""
    property bool showCursor: true
    property color textColor: "#e0ecf4"
    property color promptColor: "#00d4ff"
    property color placeholderColor: "#708090"
    property color backgroundColor: "#0a1018"
    property color borderColor: "#070c16"
    property color borderFocusColor: "#5588cc"
    property color glowColor: "#00d4ff"
    property bool enableGlow: true
    property int glowRadius: 8
    property bool enableCursorBlink: true
    property int cursorBlinkInterval: 530
    property font font

    signal accepted()

    implicitHeight: 48
    implicitWidth: 300

    Rectangle {
        id: background
        anchors.fill: parent
        color: root.backgroundColor
        radius: 0
        border.width: 2
        border.color: input.activeFocus ? root.borderFocusColor : root.borderColor

        Behavior on border.color {
            ColorAnimation { duration: 150 }
        }
    }

    // Glow effect when focused
    Rectangle {
        anchors.fill: background
        anchors.margins: -root.glowRadius / 2
        radius: background.radius + root.glowRadius / 2
        color: "transparent"
        border.width: root.glowRadius
        border.color: root.glowColor
        opacity: root.enableGlow && input.activeFocus ? 0.15 : 0
        visible: root.enableGlow

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    Row {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 8

        // Terminal prompt
        Text {
            id: prompt
            anchors.verticalCenter: parent.verticalCenter
            text: root.promptText
            color: root.promptColor
            font: root.font

            // Subtle glow on prompt
            layer.enabled: root.enableGlow
            layer.effect: Item {
                property color glowColor: root.glowColor
            }
        }

        // Input field
        TextField {
            id: input
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - prompt.width - cursor.width - parent.spacing * 2
            height: parent.height

            color: root.textColor
            font: root.font
            selectionColor: root.borderFocusColor
            selectedTextColor: root.textColor
            placeholderText: root.placeholderText
            placeholderTextColor: root.placeholderColor

            background: Item {}

            cursorVisible: false

            onAccepted: root.accepted()
        }

        // Blinking cursor
        Text {
            id: cursor
            anchors.verticalCenter: parent.verticalCenter
            text: "_"
            color: root.promptColor
            font: root.font
            opacity: 1
            visible: root.showCursor && input.activeFocus

            SequentialAnimation on opacity {
                running: root.enableCursorBlink && input.activeFocus
                loops: Animation.Infinite
                NumberAnimation { to: 0; duration: root.cursorBlinkInterval }
                NumberAnimation { to: 1; duration: root.cursorBlinkInterval }
            }
        }
    }

    // Forward focus to input
    onFocusChanged: {
        if (focus) {
            input.forceActiveFocus()
        }
    }

    function clear() {
        input.text = ""
    }

    function forceActiveFocus() {
        input.forceActiveFocus()
    }
}
