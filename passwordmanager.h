#ifndef PASSWORDMANAGER_H
#define PASSWORDMANAGER_H

#include <QObject>

class PasswordManager : public QObject
{
    Q_OBJECT
public:
    explicit PasswordManager(QObject *parent = nullptr);

public slots:
    void checkPassword(const QString &password);

signals:
    void correctPasswordEntered();
    void incorrectPasswordEntered(const QString& errorMessage);
};

#endif // PASSWORDMANAGER_H
