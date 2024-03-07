#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "applicationinitializer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    ApplicationInitializer init;
    return app.exec();
}
