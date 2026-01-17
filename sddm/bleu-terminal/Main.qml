import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

import "Components"

Rectangle {
    id: root

    // Theme colors from Bleu palette
    readonly property color colorBackground: "#050a14"
    readonly property color colorInputBg: "#0a1018"
    readonly property color colorBorder: "#1a2a3a"
    readonly property color colorBorderFocus: "#5588cc"
    readonly property color colorText: "#e0ecf4"
    readonly property color colorDimmed: "#708090"
    readonly property color colorAccent: "#00d4ff"
    readonly property color colorButton: "#5588cc"
    readonly property color colorButtonText: "#fefefe"
    readonly property color colorError: "#A167A5"
    readonly property color colorSuccess: "#99FFE4"

    // Configuration
    readonly property string fontFamily: config.Font || "monospace"
    readonly property int fontSize: parseInt(config.FontSize) || 14
    readonly property bool enableScanlines: config.EnableScanlines === "true"
    readonly property real scanlinesOpacity: parseFloat(config.ScanlinesOpacity) || 0.03
    readonly property bool enableGlow: config.EnableGlow === "true"
    readonly property int glowRadius: parseInt(config.GlowRadius) || 8
    readonly property bool enableCursorBlink: config.EnableCursorBlink === "true"
    readonly property int cursorBlinkInterval: parseInt(config.CursorBlinkInterval) || 530
    readonly property string clockFormat: config.ClockFormat || "yyyy-MM-dd HH:mm:ss"

    property int currentUserIndex: userModel.lastIndex >= 0 ? userModel.lastIndex : 0
    property int currentSessionIndex: sessionModel.lastIndex >= 0 ? sessionModel.lastIndex : 0
    property string hostname: sddm.hostName || "localhost"

    color: colorBackground

    // Scanline overlay effect
    Canvas {
        id: scanlines
        anchors.fill: parent
        visible: enableScanlines
        opacity: scanlinesOpacity
        z: 100

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = "#000000"
            ctx.lineWidth = 1

            for (var y = 0; y < height; y += 2) {
                ctx.beginPath()
                ctx.moveTo(0, y)
                ctx.lineTo(width, y)
                ctx.stroke()
            }
        }

        Component.onCompleted: requestPaint()
    }

    // Clock - top right
    Clock {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 40
        anchors.rightMargin: 40
        format: clockFormat
        textColor: colorText
        dimmedColor: colorDimmed
        accentColor: colorAccent
        glowColor: colorAccent
        enableGlow: root.enableGlow
        font.family: fontFamily
        font.pixelSize: fontSize
    }

    // System info - top left
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 40
        anchors.leftMargin: 40
        width: sysInfoCol.width + 24
        height: sysInfoCol.height + 16
        color: "transparent"
        border.width: 1
        border.color: colorBorder
        radius: 0

        Column {
            id: sysInfoCol
            anchors.centerIn: parent
            spacing: 4

            Text {
                text: "// bleu-terminal v1.0"
                color: colorDimmed
                font.family: fontFamily
                font.pixelSize: fontSize - 2
            }

            Text {
                text: "host: " + hostname
                color: colorDimmed
                font.family: fontFamily
                font.pixelSize: fontSize - 2
            }

            Text {
                text: "system: " + Qt.platform.os
                color: colorDimmed
                font.family: fontFamily
                font.pixelSize: fontSize - 2
            }
        }
    }

    // Main login container - center
    Rectangle {
        id: loginContainer
        anchors.centerIn: parent
        width: 420
        height: loginColumn.height + 48
        color: colorInputBg
        border.width: 1
        border.color: colorBorder
        radius: 0

        // Accent line at top
        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: -1
            anchors.leftMargin: 40
            anchors.rightMargin: 40
            height: 2
            color: colorAccent
            radius: 0
        }

        Column {
            id: loginColumn
            anchors.centerIn: parent
            width: parent.width - 48
            spacing: 20

            // Header
            Column {
                width: parent.width
                spacing: 4

                Text {
                    text: "[ login ]"
                    color: colorAccent
                    font.family: fontFamily
                    font.pixelSize: fontSize + 4
                    font.bold: true
                }

                Text {
                    text: "Welcome to " + hostname
                    color: colorText
                    font.family: fontFamily
                    font.pixelSize: fontSize
                }

                Text {
                    text: "Enter credentials to continue..."
                    color: colorDimmed
                    font.family: fontFamily
                    font.pixelSize: fontSize - 2
                }
            }

            // Username field
            Column {
                width: parent.width
                spacing: 6

                Text {
                    text: "user@" + hostname + " ~"
                    color: colorAccent
                    font.family: fontFamily
                    font.pixelSize: fontSize - 2
                }

                Input {
                    id: usernameField
                    width: parent.width
                    promptText: "$"
                    placeholderText: "username"
                    text: userModel.lastUser || ""
                    textColor: colorText
                    promptColor: colorAccent
                    placeholderColor: colorDimmed
                    backgroundColor: colorBackground
                    borderColor: colorBorder
                    borderFocusColor: colorBorderFocus
                    glowColor: colorAccent
                    enableGlow: root.enableGlow
                    glowRadius: root.glowRadius
                    enableCursorBlink: root.enableCursorBlink
                    cursorBlinkInterval: root.cursorBlinkInterval
                    font.family: fontFamily
                    font.pixelSize: fontSize

                    onAccepted: passwordField.forceActiveFocus()

                    KeyNavigation.down: passwordField
                    KeyNavigation.tab: passwordField
                }
            }

            // Password field
            Column {
                width: parent.width
                spacing: 6

                Text {
                    text: "password"
                    color: colorDimmed
                    font.family: fontFamily
                    font.pixelSize: fontSize - 2
                }

                Input {
                    id: passwordField
                    width: parent.width
                    promptText: ">"
                    placeholderText: "********"
                    echoMode: TextInput.Password
                    textColor: colorText
                    promptColor: colorAccent
                    placeholderColor: colorDimmed
                    backgroundColor: colorBackground
                    borderColor: colorBorder
                    borderFocusColor: colorBorderFocus
                    glowColor: colorAccent
                    enableGlow: root.enableGlow
                    glowRadius: root.glowRadius
                    enableCursorBlink: root.enableCursorBlink
                    cursorBlinkInterval: root.cursorBlinkInterval
                    font.family: fontFamily
                    font.pixelSize: fontSize

                    onAccepted: login()

                    KeyNavigation.up: usernameField
                    KeyNavigation.tab: loginButton
                }
            }

            // Caps lock warning
            Text {
                id: capsLockWarning
                text: "! CAPS LOCK IS ON"
                color: colorError
                font.family: fontFamily
                font.pixelSize: fontSize - 2
                visible: keyboard.capsLock

                SequentialAnimation on opacity {
                    running: capsLockWarning.visible
                    loops: Animation.Infinite
                    NumberAnimation { to: 0.5; duration: 500 }
                    NumberAnimation { to: 1; duration: 500 }
                }
            }

            // Error message
            Text {
                id: errorMessage
                text: "ERROR: " + errorText
                property string errorText: ""
                color: colorError
                font.family: fontFamily
                font.pixelSize: fontSize - 2
                visible: errorText !== ""
                wrapMode: Text.WordWrap
                width: parent.width
            }

            // Login button
            Button {
                id: loginButton
                anchors.horizontalCenter: parent.horizontalCenter
                text: "LOGIN"
                textColor: colorText
                accentColor: colorAccent
                backgroundColor: "transparent"
                borderColor: colorBorder
                hoverBorderColor: colorAccent
                glowColor: colorAccent
                enableGlow: root.enableGlow
                showBrackets: true
                font.family: fontFamily
                font.pixelSize: fontSize

                onClicked: login()

                KeyNavigation.up: passwordField
            }
        }
    }

    // Session selector - bottom left
    SessionButton {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 40
        anchors.leftMargin: 40
        model: sessionModel
        currentIndex: root.currentSessionIndex
        textColor: colorText
        dimmedColor: colorDimmed
        accentColor: colorAccent
        backgroundColor: colorInputBg
        hoverColor: "#121c28"
        borderColor: colorBorder
        font.family: fontFamily
        font.pixelSize: fontSize - 2

        onSessionChanged: function(index) {
            root.currentSessionIndex = index
        }
    }

    // Power menu - bottom right
    PowerMenu {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 40
        anchors.rightMargin: 40
        textColor: colorText
        dimmedColor: colorDimmed
        accentColor: colorAccent
        hoverColor: "#121c28"
        backgroundColor: colorInputBg
        borderColor: colorBorder
        dangerColor: colorError
        font.family: fontFamily
        font.pixelSize: fontSize - 2

        onShutdown: sddm.powerOff()
        onReboot: sddm.reboot()
        onSuspend: sddm.suspend()
    }

    // Keyboard indicator - bottom center
    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 40
        spacing: 16

        Text {
            text: keyboard.capsLock ? "[CAPS]" : "[caps]"
            color: keyboard.capsLock ? colorError : colorDimmed
            font.family: fontFamily
            font.pixelSize: fontSize - 2
        }

        Text {
            text: keyboard.numLock ? "[NUM]" : "[num]"
            color: keyboard.numLock ? colorAccent : colorDimmed
            font.family: fontFamily
            font.pixelSize: fontSize - 2
        }
    }

    // Login function
    function login() {
        errorMessage.errorText = ""

        if (usernameField.text === "") {
            errorMessage.errorText = "Username cannot be empty"
            usernameField.forceActiveFocus()
            return
        }

        if (passwordField.text === "") {
            errorMessage.errorText = "Password cannot be empty"
            passwordField.forceActiveFocus()
            return
        }

        sddm.login(usernameField.text, passwordField.text, currentSessionIndex)
    }

    // Handle login failure
    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.errorText = "Authentication failed. Check credentials."
            passwordField.clear()
            passwordField.forceActiveFocus()
        }
    }

    // Initial focus
    Component.onCompleted: {
        if (usernameField.text === "") {
            usernameField.forceActiveFocus()
        } else {
            passwordField.forceActiveFocus()
        }
    }

    // Keyboard shortcuts
    Keys.onPressed: function(event) {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            login()
            event.accepted = true
        }
    }
}
