import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property alias text: label.text
    property color textColor: "#e0ecf4"
    property color accentColor: "#00d4ff"
    property color backgroundColor: "transparent"
    property color borderColor: "#5588cc"
    property color hoverBorderColor: "#00d4ff"
    property color hoverColor: "#6699dd"
    property color pressedColor: "#4477bb"
    property color glowColor: "#00d4ff"
    property bool enableGlow: true
    property int glowRadius: 6
    property bool showBrackets: true
    property font font

    signal clicked()

    implicitHeight: 36
    implicitWidth: label.implicitWidth + 48

    // Main button container
    Rectangle {
        id: background
        anchors.fill: parent
        color: mouseArea.pressed ? Qt.rgba(root.pressedColor.r, root.pressedColor.g, root.pressedColor.b, 0.3) :
               mouseArea.containsMouse ? Qt.rgba(root.hoverColor.r, root.hoverColor.g, root.hoverColor.b, 0.15) :
               root.backgroundColor
        radius: 0
        border.width: 1
        border.color: mouseArea.containsMouse ? root.hoverBorderColor : root.borderColor

        Behavior on border.color {
            ColorAnimation { duration: 150 }
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }

    // Glow effect on hover
    Rectangle {
        anchors.fill: background
        anchors.margins: -2
        radius: 0
        color: "transparent"
        border.width: 1
        border.color: root.glowColor
        opacity: root.enableGlow && mouseArea.containsMouse ? 0.4 : 0
        visible: root.enableGlow

        Behavior on opacity {
            NumberAnimation { duration: 150 }
        }
    }

    // Button text
    Text {
        id: label
        anchors.centerIn: parent
        color: mouseArea.containsMouse ? root.accentColor : root.textColor
        font: root.font

        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }

    // Decorative brackets
    Text {
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        text: ">"
        color: mouseArea.containsMouse ? root.accentColor : root.borderColor
        font: root.font
        visible: root.showBrackets

        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        text: "<"
        color: mouseArea.containsMouse ? root.accentColor : root.borderColor
        font: root.font
        visible: root.showBrackets

        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
}
