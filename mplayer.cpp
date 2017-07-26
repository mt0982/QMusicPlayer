#include "mplayer.h"

MPlayer::MPlayer(QObject *parent): QObject(parent)
{
    player = new QMediaPlayer;
    player->setVolume(100);
    player->setPlaylist(playlist.getPlaylist());

    connect(player, SIGNAL(durationChanged(qint64)), this, SLOT(durationChanged(qint64)));
    connect(player, SIGNAL(positionChanged(qint64)), this, SLOT(positionChanged(qint64)));
    connect(player->playlist(), SIGNAL(currentIndexChanged(int)), this, SLOT(stateChanged(int)));
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

void MPlayer::setMedia(const int index)
{
    player->playlist()->setCurrentIndex(index);
    if (player->state() != QMediaPlayer::PlayingState) player->play();
}

QStringList MPlayer::baseNames()
{
    return playlist.getBaseNames();
}

QStringList MPlayer::absolutePaths()
{
    return playlist.getAbsolutePaths();
}

void MPlayer::forward()
{
    player->playlist()->next();
}

void MPlayer::backward()
{
    player->playlist()->previous();
}

int MPlayer::currentIndex()
{
    qDebug() << "MPlayer::currentIndex()";
    if (player->state() == QMediaPlayer::PlayingState) return player->playlist()->currentIndex();
    return -1;
}

void MPlayer::setPlaybackMode(const int value)
{
    qDebug() << "MPlayer::setPlaybackMode" << value;

    switch (value) {
    case 1:
        player->playlist()->setPlaybackMode(QMediaPlaylist::CurrentItemInLoop);
        break;
    case 2:
        player->playlist()->setPlaybackMode(QMediaPlaylist::Sequential);
        break;
    case 3:
        player->playlist()->setPlaybackMode(QMediaPlaylist::Loop);
        break;
    case 4:
        player->playlist()->setPlaybackMode(QMediaPlaylist::Random);
        break;
    default:
        break;
    }
}

void MPlayer::durationChanged(qint64 duration)
{
    qDebug() << "MPlayer::durationChanged(qint64):" << duration;

    int seconds = duration / 1000;
    int minutes = seconds / 60;
    int sec = seconds - (minutes * 60);

    QString text = QString::number(minutes) + ":" + QString("%1").arg(sec, 2, 10, QChar('0'));

    emit sendDuration(duration, text, player->playlist()->currentIndex());
}

void MPlayer::positionChanged(qint64 position)
{
    int seconds = position / 1000;
    int minutes = seconds / 60;
    int sec = seconds - (minutes * 60);

    QString text = QString::number(minutes) + ":" + QString("%1").arg(sec, 2, 10, QChar('0'));

    emit sendPosition(position, text);
}

void MPlayer::stateChanged(int)
{
    qDebug() << "void MPlayer::stateChanged()" << player->state();
    if (player->state() == QMediaPlayer::PlayingState) emit sendStatus("qrc:/icon/pause.png");
    else emit sendStatus("qrc:/icon/play.png");
}




















