#include "hellocpp.h"
#include <QDebug>
#include <syslog.h>

#include <QFile>
#include <QTextStream>

#include <future>
#include <chrono>
#include <thread>
#include <iostream>
#include <iomanip>

#include <QtSensors/QAccelerometer>

HelloCpp::HelloCpp(QObject *parent) :
QObject(parent)
{
}

void HelloCpp::printMessage(QString txt)
{
}

void SensorPolling(QSensorReading* reading)
{
    while (true){
        qreal x = reading->property("x").value<qreal>();
        qreal y = reading->value(1).value<qreal>();
        double px = x;
        syslog(LOG_INFO, std::to_string(px).c_str());

//        QString filename = "/home/ceres/test-tracktxt";
//        QFile file(filename);
//        if (file.open(QIODevice::Append)) {
//            QTextStream stream(&file);
//            stream << "something" << endl;
//        }

        std::this_thread::sleep_for(std::chrono::seconds(2));
    }
}


void HelloCpp::startTracking() {
    syslog(LOG_INFO, "Starting Tracking");
    HelloCpp::isWorking = !HelloCpp::isWorking;
    emit testSignal(HelloCpp::isWorking);

    QSensor sensor("QGyroscope");
    sensor.start();
    QSensorReading *reading = sensor.reading();

    qreal x = reading->property("x").value<qreal>();
    double px = x;
    syslog(LOG_INFO, std::to_string(px).c_str());

//    auto res = std::async(std::launch::async, [&]{
//        SensorPolling(reading);
//    });
}

