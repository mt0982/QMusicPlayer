#ifndef MPLAYLIST_H
#define MPLAYLIST_H

#include <QDir>
#include <QDirIterator>
#include <QDebug>
#include <QMediaPlaylist>

struct MFileInfo {
    QString baseName;
    QString absolutePath;

    MFileInfo() {}
    MFileInfo(QString name, QString path) : baseName(name), absolutePath(path) {}
};

class MPlaylist {

public:
    MPlaylist();

    QStringList getAbsolutePaths() const;
    QStringList getBaseNames() const;
    QMediaPlaylist *getPlaylist() const;

private:
    QList<MFileInfo> mFileInfo;
    QMediaPlaylist *playlist;
    QStringList absolutePaths;
    QStringList baseNames;
};

#endif // MPLAYLIST_H



















