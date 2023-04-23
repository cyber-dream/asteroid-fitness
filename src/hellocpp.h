#ifndef HELLOCPP_H
#define HELLOCPP_H

#include <QObject>
#include <QtSensors>

class HelloCpp : public QObject
{
Q_OBJECT
public:
    explicit HelloCpp(QObject *parent = 0);
    Q_INVOKABLE bool isRunning() const { return isWorking; }
    Q_INVOKABLE void startTracking();


private:
    bool isWorking;
    QSensorReading *reading;

signals:
    void testSignal(const bool isWorking) const;
public slots:

};

#endif // HELLOCPP_H
