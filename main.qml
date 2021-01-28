import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import org.kde.kirigami 2.12 as Kirigami
import SpeechClient 1.0

Kirigami.AbstractApplicationWindow {
    visible: true
    visibility: "Maximized"
    title: qsTr("Hello World")
    Kirigami.Theme.colorSet: Kirigami.Theme.View
    Kirigami.Theme.inherit: true


    SpeechClient {
        id: speakc
    }

    ColumnLayout {
        anchors.fill: parent

        TextField {
            id: txt1
            Layout.fillWidth: true
            Layout.fillHeight: true
            wrapMode: Text.WordWrap
            text: "A speech is a formal address, delivered to an audience, that seeks to convince, persuade, inspire or inform. From historic moments to the present day, the English language has given us some extraordinary examples of the spoken word. A powerful tool in the right – or wrong – hands, spoken English can, and has, changed the world."
        }

        Button {
            id: spkBtn
            Layout.fillWidth: true
            Layout.fillHeight: true
            Kirigami.Theme.colorSet: Kirigami.Theme.Button
            Kirigami.Theme.inherit: false
            text: "Speak"
            onClicked: {
                speakc.speak(txt1.text)
            }
        }
    }
}
