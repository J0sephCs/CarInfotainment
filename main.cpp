#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "radialbar.h"
#include "musicdata.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;


    qmlRegisterType<RadialBar>("CustomControls", 1, 0, "RadialBar");
    engine.addImportPath("qrc:/CarInfotainment");


    MusicData musicData;
    engine.rootContext()->setContextProperty("musicData", &musicData);

    const QUrl url(QStringLiteral("qrc:/CarInfotainment/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}


