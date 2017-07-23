#ifndef MPLAYER_H
#define MPLAYER_H

#include <QMediaPlayer>

class MPlayer : public QObject {
    Q_OBJECT

public:
    explicit MPlayer(QObject *parent = 0);

    Q_INVOKABLE int play();
    Q_INVOKABLE void setPosition(qint64 position);

private:
    QMediaPlayer *player;

private slots:
    void durationChanged(qint64 duration);
    void positionChanged(qint64 position);

signals:
    void sendDuration(qint64 duration, QString durationText);
    void sendPosition(qint64 position, QString positionText);
};

#endif // MPLAYER_H
