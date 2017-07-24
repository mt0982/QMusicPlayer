#ifndef MPLAYLIST_H
#define MPLAYLIST_H

#include <QDir>
#include <QDirIterator>
#include <QDebug>

class MPlaylist {

public:
    MPlaylist();

    QStringList getAbsolutePaths() const;
    QStringList getBaseNames() const;

private:
    QStringList baseNames;
    QStringList absolutePaths;
};

#endif // MPLAYLIST_H



















