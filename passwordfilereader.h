#ifndef PASSWORDFILEREADER_H
#define PASSWORDFILEREADER_H

#include <QString>
#include <QVector>

class PasswordFileReader {
public:
    static PasswordFileReader& instance();

    QString getPasswords() const;

private:
    PasswordFileReader();
    PasswordFileReader(const PasswordFileReader& other); // Copy constructor
    PasswordFileReader& operator=(const PasswordFileReader& other); // Assignment operator

    void readPasswordsFromFile();

    QString m_filePath;
    QString m_passwords;
};

#endif // PASSWORDFILEREADER_H
