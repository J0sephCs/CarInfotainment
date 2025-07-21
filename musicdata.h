#ifndef MUSICDATA_H
#define MUSICDATA_H

#include <QObject>
#include <QString>
#include <QJsonArray>

class MusicData : public QObject{

    Q_OBJECT
    Q_PROPERTY(QString songName READ songName WRITE setSongName NOTIFY songNameChanged FINAL)
    Q_PROPERTY(QString artistName READ artistName WRITE setArtistName NOTIFY artistNameChanged FINAL)
    Q_PROPERTY(QString albumCover READ albumCover WRITE setAlbumCover NOTIFY albumCoverChanged FINAL)


public:

    explicit MusicData(QObject *parent = nullptr);

    QString songName() const;
    void setSongName(const QString &songName);


    QString artistName() const;
    void setArtistName(const QString &artistName);

    QString albumCover() const;
    void setAlbumCover(const QString &albumCover);

signals:

    void songNameChanged();
    void artistNameChanged();
    void albumCoverChanged();


private slots:

    void updateMusicData();

private:
    QString m_songName;
    QString m_artistName;
    QString m_albumCover;
    QJsonArray m_musicData;
    int m_currentIdx;

    void loadMusicData();
    void startPlaylist();

};

#endif // MUSICDATA_H
