import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property var model
    property int currentIndex: 0
    property color textColor: "#e0ecf4"
    property color dimmedColor: "#708090"
    property color accentColor: "#00d4ff"
    property color backgroundColor: "#0a1018"
    property color hoverColor: "#121c28"
    property color borderColor: "#070c16"
    property font font

    signal sessionChanged(int index)

    implicitHeight: 32
    implicitWidth: 200

    // Current session display
    Rectangle {
        id: button
        anchors.fill: parent
        color: mouseArea.containsMouse ? root.hoverColor : root.backgroundColor
        radius: 0
        border.width: 1
        border.color: root.borderColor

        Row {
            anchors.centerIn: parent
            spacing: 8

            Text {
                text: "session:"
                color: root.dimmedColor
                font: root.font
            }

            Text {
                text: root.model && root.model.count > 0 ? root.model.get(root.currentIndex).name : "default"
                color: root.accentColor
                font: root.font
            }

            Text {
                text: popup.visible ? "^" : "v"
                color: root.dimmedColor
                font: root.font
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: popup.visible ? popup.close() : popup.open()
        }
    }

    // Dropdown popup
    Popup {
        id: popup
        y: -contentHeight - 4
        width: parent.width
        padding: 4

        background: Rectangle {
            color: root.backgroundColor
            radius: 0
            border.width: 1
            border.color: root.borderColor
        }

        contentItem: ListView {
            id: listView
            implicitHeight: contentHeight
            model: root.model
            clip: true
            currentIndex: root.currentIndex

            delegate: Rectangle {
                width: listView.width
                height: 28
                color: delegateMouseArea.containsMouse ? root.hoverColor : "transparent"
                radius: 0

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: (index === root.currentIndex ? "> " : "  ") + model.name
                    color: index === root.currentIndex ? root.accentColor : root.textColor
                    font: root.font
                }

                MouseArea {
                    id: delegateMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        root.currentIndex = index
                        root.sessionChanged(index)
                        popup.close()
                    }
                }
            }
        }
    }
}
