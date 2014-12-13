import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id: root
    color: "#101010"
    focus: true

    // Signal this in order to go back
    signal resume;

    Bookmarks{
        id: bookmarks

        anchors{
            top:    jump_to_button.bottom
            left:   parent.left
            right:  parent.right
            bottom: parent.bottom
        }
    }

    function refresh(){
        bookmarks.refresh()
    }

    // Resume button
    Rectangle{
        id: resume_button
        height: 48
        color: "#101010"
        anchors.left:  parent.left
        anchors.right: parent.right

        Image{
            height: 32

            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            source: "qrc:/arrow_down.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: resume()
        }

        // Separator
        Rectangle{
            height: 1
            color: "#505050"

            anchors {
                right: parent.right
                left: parent.left
                bottom: parent.bottom
            }
        }
    }

    // Jump to button
    Rectangle{
        id: jump_to_button
        height: 48
        color: "#101010"
        anchors.left:  parent.left
        anchors.right: parent.right
        anchors.top: resume_button.bottom

        Label{
            font.pixelSize: 20
            anchors.centerIn: parent

            text: "Jump to page"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: enterPage(twokinds.getIntFromDialog("Jump to page", "Select page number:", 0, twokinds.getArchiveLength()))
        }

        // Separator
        Rectangle{
            height: 1
            color: "#505050"

            anchors {
                right: parent.right
                left: parent.left
                bottom: parent.bottom
            }
        }
    }

}
