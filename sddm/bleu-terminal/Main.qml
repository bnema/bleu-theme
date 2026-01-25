import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    id: root

    // Bleu palette - matching hyprlock
    readonly property color bgColor: "#050a14"
    readonly property color textColor: "#e0ecf4"
    readonly property color dimmedColor: "#708090"
    readonly property color accentColor: "#00d4ff"
    readonly property color errorColor: "#A167A5"
    readonly property color successColor: "#99FFE4"
    readonly property color warningColor: "#FDBD85"

    readonly property string fontFamily: "JetBrainsMono Nerd Font Mono"
    readonly property int fontSize: 18
    readonly property int logoFontSize: 12

    property int currentSessionIndex: sessionModel.lastIndex >= 0 ? sessionModel.lastIndex : 0
    property string hostname: sddm.hostName || "arch"

    color: bgColor

    // Arch ASCII logo with gradient - above center
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: loginArea.top
        anchors.bottomMargin: 30
        spacing: 0

        // Lines 1-4: bright cyan
        Text { text: "                   -`"; color: "#00d4ff"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "                  .o+`"; color: "#00d4ff"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "                 `ooo/"; color: "#00d4ff"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "                `+oooo:"; color: "#00d4ff"; font.family: fontFamily; font.pixelSize: logoFontSize }

        // Lines 5-8: transition cyan to blue
        Text { text: "               `+oooooo:"; color: "#00c4ef"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "               -+oooooo+:"; color: "#00b4df"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "             `/:-:++oooo+:"; color: "#22a4cf"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "            `/++++/+++++++:"; color: "#4494bf"; font.family: fontFamily; font.pixelSize: logoFontSize }

        // Lines 9-13: blue to sky blue
        Text { text: "           `/++++++++++++++:"; color: "#5588cc"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "          `/+++ooooooooooooo/`"; color: "#5580c0"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "         ./ooosssso++osssssso+`"; color: "#5078b4"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "        .oossssso-````/ossssss+`"; color: "#4a7ba7"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "       -osssssso.      :ssssssso."; color: "#4a7ba7"; font.family: fontFamily; font.pixelSize: logoFontSize }

        // Lines 14-19: dimmed
        Text { text: "      :osssssss/        osssso+++."; color: "#5a7a9a"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "     /ossssssss/        +ssssooo/-"; color: "#607a94"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "   `/ossssso+/:-        -:/+osssso+-"; color: "#657a90"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: "  `+sso+:-`                 `.-/+oso:"; color: "#6a7a8c"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: " `++:.                           `-/+/"; color: "#6e7a88"; font.family: fontFamily; font.pixelSize: logoFontSize }
        Text { text: " .`                                 `"; color: "#708090"; font.family: fontFamily; font.pixelSize: logoFontSize }
    }

    // Main login area - center
    Column {
        id: loginArea
        anchors.centerIn: parent
        spacing: 12

        // Login prompt line
        Row {
            spacing: 0

            Text {
                text: hostname + " login: "
                color: dimmedColor
                font.family: fontFamily
                font.pixelSize: fontSize
            }

            TextInput {
                id: usernameInput
                width: 150
                color: textColor
                font.family: fontFamily
                font.pixelSize: fontSize
                text: userModel.lastUser || ""
                clip: true

                onAccepted: passwordInput.forceActiveFocus()

                Keys.onDownPressed: passwordInput.forceActiveFocus()
                Keys.onTabPressed: passwordInput.forceActiveFocus()
            }
        }

        // Password prompt line
        Row {
            spacing: 0

            Text {
                text: "Password: "
                color: dimmedColor
                font.family: fontFamily
                font.pixelSize: fontSize
            }

            TextInput {
                id: passwordInput
                width: 120
                color: textColor
                font.family: fontFamily
                font.pixelSize: fontSize
                echoMode: TextInput.Password
                clip: true

                onAccepted: login()

                Keys.onUpPressed: usernameInput.forceActiveFocus()
            }

            // Blinking cursor
            Text {
                text: "_"
                color: accentColor
                font.family: fontFamily
                font.pixelSize: fontSize
                opacity: cursorTimer.visible ? 1 : 0

                Timer {
                    id: cursorTimer
                    property bool visible: true
                    interval: 530
                    running: passwordInput.activeFocus
                    repeat: true
                    onTriggered: visible = !visible
                }
            }
        }

        // Error message
        Text {
            id: errorMessage
            text: ""
            color: errorColor
            font.family: fontFamily
            font.pixelSize: fontSize - 4
            visible: text !== ""
        }

        // Caps lock warning
        Text {
            text: "! CAPS LOCK"
            color: warningColor
            font.family: fontFamily
            font.pixelSize: fontSize - 4
            visible: keyboard.capsLock
        }
    }

    // Time - bottom right
    Column {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        spacing: 2

        Text {
            anchors.right: parent.right
            text: Qt.formatDateTime(new Date(), "HH:mm")
            color: dimmedColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: parent.text = Qt.formatDateTime(new Date(), "HH:mm")
            }
        }

        Text {
            anchors.right: parent.right
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd")
            color: "#4a7ba7"
            font.family: fontFamily
            font.pixelSize: fontSize - 8

            Timer {
                interval: 60000
                running: true
                repeat: true
                onTriggered: parent.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd")
            }
        }
    }

    // Session indicator - bottom left
    Row {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        spacing: 4

        Text {
            text: "session:"
            color: dimmedColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6
        }

        Text {
            text: sessionModel.count > 0 ? sessionModel.get(currentSessionIndex).name : "default"
            color: accentColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    currentSessionIndex = (currentSessionIndex + 1) % sessionModel.count
                }
            }
        }
    }

    // Power options - bottom center
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        spacing: 16

        Text {
            text: "[suspend]"
            color: suspendMouse.containsMouse ? accentColor : dimmedColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6

            MouseArea {
                id: suspendMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: sddm.suspend()
            }
        }

        Text {
            text: "[reboot]"
            color: rebootMouse.containsMouse ? accentColor : dimmedColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6

            MouseArea {
                id: rebootMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: sddm.reboot()
            }
        }

        Text {
            text: "[shutdown]"
            color: shutdownMouse.containsMouse ? errorColor : dimmedColor
            font.family: fontFamily
            font.pixelSize: fontSize - 6

            MouseArea {
                id: shutdownMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: sddm.powerOff()
            }
        }
    }

    // Login function
    function login() {
        errorMessage.text = ""

        if (usernameInput.text === "") {
            errorMessage.text = "Login incorrect"
            usernameInput.forceActiveFocus()
            return
        }

        sddm.login(usernameInput.text, passwordInput.text, currentSessionIndex)
    }

    // Handle login failure
    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Login incorrect"
            passwordInput.text = ""
            passwordInput.forceActiveFocus()
        }
    }

    // Initial focus
    Component.onCompleted: {
        if (usernameInput.text === "") {
            usernameInput.forceActiveFocus()
        } else {
            passwordInput.forceActiveFocus()
        }
    }

    // Enter to login
    Keys.onReturnPressed: login()
    Keys.onEnterPressed: login()
}
