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

        QString basename = it.fileInfo().fileName().replace(".mp3", "").toLatin1(); //baseName() remove substr sometimes
        basename[0] = basename[0].toUpper();
        basename.replace("?", "");  //remove unrecognized symbols

        mFileInfo.push_back(MFileInfo(basename, it.fileInfo().absoluteFilePath()));
    }

    /* Android Download Dir */
    if (!path2.isEmpty()) {
        QDirIterator it(path2, QStringList() << "*.mp3", QDir::Files, QDirIterator::Subdirectories);
        while (it.hasNext()) {
            it.next();

            QString basename = it.fileInfo().fileName().replace(".mp3", "").toLatin1(); //baseName() ...
            basename[0] = basename[0].toUpper();
            basename.replace("?", "");  //remove unrecognized symbols

            mFileInfo.push_back(MFileInfo(basename, it.fileInfo().absoluteFilePath()));
        }
    }

    std::sort(mFileInfo.begin(), mFileInfo.end(), [](const MFileInfo &a, const MFileInfo &b)->bool {
        return a.baseName < b.baseName;
    });

    foreach (MFileInfo file, mFileInfo) {
        qDebug() << file.baseName;
        absolutePaths << file.absolutePath;
        baseNames << file.baseName;
        playlist->addMedia(QUrl::fromLocalFile(file.absolutePath));
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
