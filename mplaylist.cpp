#include "mplaylist.h"

MPlaylist::MPlaylist()
{
    QString path, path2 = "";
#ifdef Q_OS_ANDROID
    qDebug() << "Q_OS_ANDROID";
    path = "/storage/sdcard0/Music";
    path2 = "/storage/sdcard0/Download";
#else
    path = "/home/asus/Programy/Qt/Projekty/QMusicPlayer";
#endif

    QDirIterator it(path, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);
    playlist = new QMediaPlaylist;

    while (it.hasNext()) {
        it.next();
        baseNames << it.fileInfo().baseName();
        absolutePaths << it.fileInfo().absoluteFilePath();
        qDebug() << it.fileInfo().baseName() << it.fileInfo().absoluteFilePath();
        playlist->addMedia(QUrl::fromLocalFile(it.fileInfo().absoluteFilePath()));
    }

    /* Android Download Dir */
    if (!path2.isEmpty()) {
        QDirIterator it(path2, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);
        while (it.hasNext()) {
            it.next();
            baseNames << it.fileInfo().baseName();
            absolutePaths << it.fileInfo().absoluteFilePath();
            qDebug() << it.fileInfo().baseName() << it.fileInfo().absoluteFilePath();
            playlist->addMedia(QUrl::fromLocalFile(it.fileInfo().absoluteFilePath()));
        }
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
