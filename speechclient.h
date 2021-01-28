#ifndef SPEECHCLIENT_H
#define SPEECHCLIENT_H

#include <QObject>
#include <QtTextToSpeech>

class SpeechClient : public QObject
{
    Q_OBJECT

public:
    explicit SpeechClient(QObject *parent = Q_NULLPTR);

public Q_SLOTS:
    void speak(const QString &msg);
    void getVoices();

private:
    QTextToSpeech *m_speech;
    QVector<QVoice> m_voices;
};

#endif // SPEECHCLIENT_H
