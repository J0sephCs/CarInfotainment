#include "musicdata.h"
// #include <QGuiApplication>
// #include <QQmlApplicationEngine>
// #include <QQmlContext>
// #include <QObject>
// #include <QString>


#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTimer>
#include <QDebug>



    MusicData::MusicData(QObject *parent) : QObject(parent), m_currentIdx(-1){
        loadMusicData();
        startPlaylist();
    }

    QString MusicData:: songName() const {return m_songName;}
    void MusicData:: setSongName(const QString &songName){
        if(m_songName != songName){
            m_songName= songName;
            emit songNameChanged();
        }
    }


    QString MusicData:: artistName() const {return m_artistName;}
    void MusicData:: setArtistName(const QString &artistName){
        if(m_artistName != artistName){
            m_artistName= artistName;
            emit artistNameChanged();
        }
    }

    QString MusicData:: albumCover() const {return m_albumCover;}
    void MusicData:: setAlbumCover(const QString &albumCover){
        if(m_albumCover != albumCover){
            m_albumCover= albumCover;
            emit albumCoverChanged();
        }
    }



    void MusicData:: updateMusicData(){
        if(m_musicData.isEmpty()) return;
        m_currentIdx= (m_currentIdx + 1) % m_musicData.size();

        QJsonObject track= m_musicData[m_currentIdx].toObject();
        setSongName(track["songName"].toString());
        setArtistName(track["artistName"].toString());
        setAlbumCover(track["albumCover"].toString());
    }



    void MusicData:: loadMusicData(){
        QFile file(":/musicData.json");

        if(!file.open(QIODevice::ReadOnly)){
            qDebug() << "Failed to open JSON file";
            return;
        }

        QByteArray data= file.readAll();
        file.close();

        QJsonDocument doc= QJsonDocument::fromJson(data);

        if(doc.isNull() || !doc.isArray()){
            qDebug() << "Failed to parse data";
            return;
        }
        m_musicData= doc.array();
    }


    void MusicData:: startPlaylist(){
        QTimer *timer= new QTimer(this);
        connect(timer, &QTimer::timeout, this, &MusicData::updateMusicData);
        timer->start(5000);
    }


