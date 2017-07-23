#ifndef MPLAYER_H
#define MPLAYER_H

#include <QMediaPlayer>

class MPlayer : public QObject {
    Q_OBJECT

public:
    explicit MPlayer(QObject *parent = 0);

    Q_INVOKABLE int play();

private:
    QMediaPlayer *player;

private slots:
    void durationChanged(qint64 duration);

signals:
    void sendDuration(qint64);
};

#endif // MPLAYER_H
