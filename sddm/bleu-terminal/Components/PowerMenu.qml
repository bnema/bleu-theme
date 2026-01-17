import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property color textColor: "#e0ecf4"
    property color dimmedColor: "#708090"
    property color accentColor: "#00d4ff"
    property color hoverColor: "#121c28"
    property color backgroundColor: "#0a1018"
    property color borderColor: "#070c16"
    property color dangerColor: "#A167A5"
    property font font

    signal shutdown()
    signal reboot()
    signal suspend()

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 12

        // Suspend button
        Rectangle {
            Layout.preferredWidth: suspendText.implicitWidth + 16
            Layout.preferredHeight: 28
            color: suspendMouse.containsMouse ? root.hoverColor : "transparent"
            radius: 0
            border.width: suspendMouse.containsMouse ? 1 : 0
            border.color: root.borderColor

            Text {
                id: suspendText
                anchors.centerIn: parent
                text: "[suspend]"
                color: suspendMouse.containsMouse ? root.accentColor : root.dimmedColor
                font: root.font

                Behavior on color {
                    ColorAnimation { duration: 100 }
                }
            }

            MouseArea {
                id: suspendMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.suspend()
            }
        }

        // Reboot button
        Rectangle {
            Layout.preferredWidth: rebootText.implicitWidth + 16
            Layout.preferredHeight: 28
            color: rebootMouse.containsMouse ? root.hoverColor : "transparent"
            radius: 0
            border.width: rebootMouse.containsMouse ? 1 : 0
            border.color: root.borderColor

            Text {
                id: rebootText
                anchors.centerIn: parent
                text: "[reboot]"
                color: rebootMouse.containsMouse ? root.accentColor : root.dimmedColor
                font: root.font

                Behavior on color {
                    ColorAnimation { duration: 100 }
                }
            }

            MouseArea {
                id: rebootMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.reboot()
            }
        }

        // Shutdown button
        Rectangle {
            Layout.preferredWidth: shutdownText.implicitWidth + 16
            Layout.preferredHeight: 28
            color: shutdownMouse.containsMouse ? root.hoverColor : "transparent"
            radius: 0
            border.width: shutdownMouse.containsMouse ? 1 : 0
            border.color: root.borderColor

            Text {
                id: shutdownText
                anchors.centerIn: parent
                text: "[shutdown]"
                color: shutdownMouse.containsMouse ? root.dangerColor : root.dimmedColor
                font: root.font

                Behavior on color {
                    ColorAnimation { duration: 100 }
                }
            }

            MouseArea {
                id: shutdownMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.shutdown()
            }
        }
    }
}
