#ifndef HELLOCPP_H
#define HELLOCPP_H

#include <QObject>

class HelloCpp : public QObject
{
Q_OBJECT
public:
    explicit HelloCpp(QObject *parent = 0);
    Q_INVOKABLE void printMessage(QString txt);
    Q_INVOKABLE bool isRunning() const { return isWorking; }
    Q_INVOKABLE void startTracking();

private:
    bool isWorking;

signals:
    void testSignal(const bool isWorking) const;
public slots:

};

#endif // HELLOCPP_H
