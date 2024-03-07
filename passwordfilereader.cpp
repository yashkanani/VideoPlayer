#include "passwordfilereader.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QtGlobal>

PasswordFileReader& PasswordFileReader::instance() {
    static PasswordFileReader instance;
    return instance;
}

PasswordFileReader::PasswordFileReader() {
#ifdef Q_OS_LINUX
    m_filePath = "/home/user1/passcode.txt";
#elif defined(Q_OS_WIN)
    m_filePath = "C:/passcode.txt";
#else
    m_filePath = ""; // Unsupported OS, set an empty file path
#endif
    readPasswordsFromFile();
}

QString PasswordFileReader::getPasswords() const {
    return m_passwords;
}

void PasswordFileReader::readPasswordsFromFile() {
    if (m_filePath.isEmpty()) {
        qDebug() << "Unsupported Operating System";
        return;
    }

    QFile file(m_filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Failed to open file for reading: " << file.errorString();
        return;
    }

    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine().trimmed(); // Remove leading/trailing whitespace
        if (!line.isEmpty()) {
            m_passwords = line;
        }
    }

    file.close();
}
