#include "passwordmanager.h"
#include <QDebug>
#include "passwordfilereader.h"

PasswordManager::PasswordManager(QObject *parent) : QObject(parent)
{
}

void PasswordManager::checkPassword(const QString &password)
{
    if (password.isEmpty()){
        emit incorrectPasswordEntered("Please enter the PIN");
        return;
    }


    if (password.compare(PasswordFileReader::instance().getPasswords()) == 0) {
        emit correctPasswordEntered();
    } else {
        emit incorrectPasswordEntered("Error: Incorrect PIN!");
    }
}
