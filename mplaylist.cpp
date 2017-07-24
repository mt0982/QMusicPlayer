#include "mplaylist.h"

MPlaylist::MPlaylist()
{
    QString path = "/home/asus/Programy/Qt/Projekty/QMusicPlayer";
    QDirIterator it(path, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);
    playlist = new QMediaPlaylist;

    while (it.hasNext()) {
        it.next();
        baseNames << it.fileInfo().baseName();
        absolutePaths << it.fileInfo().absoluteFilePath();
        qDebug() << it.fileInfo().baseName() << it.fileInfo().absoluteFilePath();
        playlist->addMedia(QUrl::fromLocalFile(it.fileInfo().absoluteFilePath()));
    }

    playlist->setPlaybackMode(QMediaPlaylist::Loop);
}

QStringList MPlaylist::getAbsolutePaths() const
{
    return absolutePaths;
}

QStringList MPlaylist::getBaseNames() const
{
    return baseNames;
}

QMediaPlaylist *MPlaylist::getPlaylist() const
{
    return playlist;
}
