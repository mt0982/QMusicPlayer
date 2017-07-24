#ifndef MPLAYLIST_H
#define MPLAYLIST_H

#include <QDir>
#include <QDirIterator>
#include <QDebug>
#include <QMediaPlaylist>

class MPlaylist {

public:
    MPlaylist();

    QStringList getAbsolutePaths() const;
    QStringList getBaseNames() const;
    QMediaPlaylist *getPlaylist() const;

private:
    QStringList baseNames;
    QStringList absolutePaths;
    QMediaPlaylist *playlist;
};

#endif // MPLAYLIST_H



















