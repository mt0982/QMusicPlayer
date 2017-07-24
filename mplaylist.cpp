#include "mplaylist.h"

MPlaylist::MPlaylist()
{
    QString path = "/home/asus/Programy/Qt/Projekty/QMusicPlayer";
    QDirIterator it(path, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);

    while (it.hasNext()){
        qDebug() << it.fileInfo().baseName();
        it.next();
    }
}
