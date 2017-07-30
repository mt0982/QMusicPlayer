#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include <mplayer.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);                   //QApplication require to correct char work
    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("QMusicPlayer");

    //QQuickStyle::setStyle("Material");

    MPlayer mPlayer;

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("mplayer", &mPlayer);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}




















