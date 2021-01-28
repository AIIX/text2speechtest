#include "speechclient.h"
#include <QDebug>

SpeechClient::SpeechClient(QObject *parent) : QObject(parent)
{

}

void SpeechClient::speak(const QString &msg)
{
    m_speech = new QTextToSpeech("flite", this);
    m_speech->say(msg);
    getVoices();
}

void SpeechClient::getVoices(){
    m_voices = m_speech->availableVoices();
    QVoice currentVoice = m_speech->voice();
    foreach (const QVoice &voice, m_voices) {
        qDebug() << voice.name();
    }
}
