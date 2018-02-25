import QtQuick 2.0

Rectangle {
    id: id_quitButton
    width: 100
    height: 50
    radius: 5
    border { color: "grey"; width: 2 }
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5
    MouseArea {
        anchors.fill: parent
        onPressed: id_quitButton.color = "#aaaaaa"
        onClicked: {
            Qt.quit()
        }
    }
    Text {
        anchors.centerIn: parent
        text: "Quit!"
        color: "grey"
        font { pointSize: 20 }
    }
}
