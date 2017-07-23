#ifndef MPLAYER_H
#define MPLAYER_H

#include <QMediaPlayer>

class MPlayer : public QObject {
    Q_OBJECT

public:
    explicit MPlayer(QObject *parent = 0);

    Q_INVOKABLE void play();

private:
    QMediaPlayer *player;
};

#endif // MPLAYER_H
