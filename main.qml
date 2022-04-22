import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
   
    property int buttonHeight : 32

    ListView {
        id: scrollView
        width: parent.width
        anchors.fill: parent
        clip: true

        TextField {
            id: mailField

            property bool valid: acceptableInput

            inputMethodHints: Qt.ImhEmailCharactersOnly | Qt.ImhNoPredictiveText

            anchors.top: parent.top
            height: buttonHeight
            width: parent.width

            validator: RegExpValidator {
                regExp:/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
            }
        }

        TextField {
            id: topic

            height: buttonHeight
            width: parent.width
            anchors.top: mailField.bottom
        }
        
        Flickable {
            id: flickable
            
            anchors.top: topic.bottom
            anchors.bottom: sendButton.top
            anchors.left: parent.left
            anchors.right: parent.right

            TextArea.flickable: TextArea {
                id: message
                
                anchors.fill: parent
    
                wrapMode: TextArea.WordWrap
                verticalAlignment: Text.AlignTop
                background: Rectangle{
                    color: "#CCC"
                }
            }
            
            clip: true
            flickableDirection: Flickable.VerticalFlick
            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        Button {
            id: sendButton
            text: "Send"

            height: buttonHeight
            width: parent.width

            anchors.bottom: parent.bottom
        }
    }
}

