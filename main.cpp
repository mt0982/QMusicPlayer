#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <mplayer.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
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
