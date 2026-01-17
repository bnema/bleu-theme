import QtQuick 2.15

Item {
    id: root

    property string format: "yyyy-MM-dd HH:mm:ss"
    property color textColor: "#e0ecf4"
    property color dimmedColor: "#708090"
    property color accentColor: "#00d4ff"
    property color glowColor: "#00d4ff"
    property bool enableGlow: true
    property font font

    implicitWidth: timeText.implicitWidth
    implicitHeight: column.implicitHeight

    Column {
        id: column
        anchors.fill: parent
        spacing: 4

        Text {
            id: timeText
            anchors.right: parent.right
            text: Qt.formatDateTime(new Date(), root.format)
            color: root.textColor
            font.family: root.font.family
            font.pixelSize: root.font.pixelSize + 2
            font.bold: true

            // Subtle glow effect
            layer.enabled: root.enableGlow
        }

        Text {
            id: uptimeLabel
            anchors.right: parent.right
            text: "system ready_"
            color: root.accentColor
            font: root.font
            opacity: 0.8

            SequentialAnimation on opacity {
                running: true
                loops: Animation.Infinite
                NumberAnimation { to: 0.4; duration: 1000 }
                NumberAnimation { to: 0.8; duration: 1000 }
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeText.text = Qt.formatDateTime(new Date(), root.format)
        }
    }
}
