#include "mplaylist.h"

MPlaylist::MPlaylist()
{
    QString path = "/home/asus/Programy/Qt/Projekty/QMusicPlayer";
    QDirIterator it(path, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);

    while (it.hasNext()) {
        baseNames << it.fileInfo().baseName();
        absolutePaths << it.fileInfo().absoluteFilePath();
        qDebug() << it.fileInfo().baseName() << it.fileInfo().absoluteFilePath();
        it.next();
    }
}

QStringList MPlaylist::getAbsolutePaths() const
{
    return absolutePaths;
}

QStringList MPlaylist::getBaseNames() const
{
    return baseNames;
}
