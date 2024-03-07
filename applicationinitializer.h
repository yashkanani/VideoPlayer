#ifndef APPLICATIONINITIALIZER_H
#define APPLICATIONINITIALIZER_H


#include <QObject>
#include "passwordmanager.h"

#include <QQmlApplicationEngine>

class ApplicationInitializer : public QObject
{
    Q_OBJECT
public:
    explicit ApplicationInitializer(QObject *parent = nullptr);

private:
    PasswordManager m_passwordManager;
    QQmlApplicationEngine m_engine;
};

#endif // APPLICATIONINITIALIZER_H
