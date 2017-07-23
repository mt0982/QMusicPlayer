#include "mplayer.h"

MPlayer::MPlayer(QObject *parent): QObject(parent)
{
    player = new QMediaPlayer;
    player->setMedia(QUrl::fromLocalFile("/home/asus/Programy/Qt/Projekty/QMusicPlayer/Hurts - Some Kind of Heaven.mp3"));
    player->setVolume(100);

    connect(player, SIGNAL(durationChanged(qint64)), this, SLOT(durationChanged(qint64)));
    connect(player, SIGNAL(positionChanged(qint64)), this, SLOT(positionChanged(qint64)));
}

int MPlayer::play()
{
    switch (player->state()) {
    case QMediaPlayer::StoppedState:
        player->play();
        break;
    case QMediaPlayer::PlayingState:
        player->pause();
        break;
    case QMediaPlayer::PausedState:
        player->play();
        break;
    default:
        break;
    }

    return player->state();
}

void MPlayer::setPosition(qint64 position)
{
    player->setPosition(position);
}

void MPlayer::durationChanged(qint64 duration)
{
    qDebug() << "MPlayer::durationChanged(qint64):" << duration;
    emit sendDuration(duration);
}

void MPlayer::positionChanged(qint64 position)
{
    emit sendPosition(position);
}




















