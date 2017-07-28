#ifndef MPLAYER_H
#define MPLAYER_H

#include <QMediaPlayer>
#include <QSettings>
#include <QAudioRecorder>
#include <QAudioProbe>
#include <mplaylist.h>

class MPlayer : public QObject {
    Q_OBJECT

public:
    explicit MPlayer(QObject *parent = 0);
    ~MPlayer();

    Q_INVOKABLE int play();
    Q_INVOKABLE void setPosition(qint64 position);
    Q_INVOKABLE void setMedia(const int index);
    Q_INVOKABLE QStringList baseNames();
    Q_INVOKABLE QStringList absolutePaths();
    Q_INVOKABLE void forward();
    Q_INVOKABLE void backward();
    Q_INVOKABLE int currentIndex();
    Q_INVOKABLE void setPlaybackMode(const int value);

private:
    QMediaPlayer *player;
    MPlaylist playlist;
    QSettings settings;

private slots:
    void durationChanged(qint64 duration);
    void positionChanged(qint64 position);
    void stateChanged(int);
    void calculateLevel(QAudioBuffer buffer);

signals:
    void sendDuration(qint64 duration, QString durationText, int currentIndex);
    void sendPosition(qint64 position, QString positionText);
    void sendStatus(QString status);
};

#endif // MPLAYER_H






















