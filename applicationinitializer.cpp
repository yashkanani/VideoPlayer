#include "applicationinitializer.h"
#include <QCoreApplication>
#include <QQmlContext>
#include <QQuickItem>

ApplicationInitializer::ApplicationInitializer(QObject *parent) : QObject(parent)
{
    m_engine.rootContext()->setContextProperty("passwordManager", &m_passwordManager);


    const QUrl url(QStringLiteral("qrc:/VideoPlayer/Main.qml"));

    QObject::connect(&m_engine, &QQmlApplicationEngine::objectCreated, QCoreApplication::instance(), [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    m_engine.load(url);
}
