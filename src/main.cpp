/*
 * Copyright (C) 2019 - Florent Revest <revestflo@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <asteroidapp.h>
#include <syslog.h>

#include <future>
#include <chrono>
#include <thread>
#include <iostream>
#include <iomanip>

#include <string>

#include "stepstracker.h"
#include "hellocpp.h"
#include "appcore.h"
//#include "sensorthread.h"
#include <QtSensors/QAccelerometer>

#include <QtQuick>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QFile>
#include <QTextStream>


//void SensorPolling(QSensorReading* reading)
//{
//    while (true){
//        qreal x = reading->property("x").value<qreal>();
//        qreal y = reading->value(1).value<qreal>();
//        double px = x;
//        syslog(LOG_INFO, std::to_string(px).c_str());


//        std::this_thread::sleep_for(std::chrono::seconds(2));
//    }
//}

int main(int argc, char *argv[]) {
    QSensor sensor("QGyroscope");
    sensor.start();
    QSensorReading *reading = sensor.reading();

    qreal x = reading->property("x").value<qreal>();
    double px = x;
    syslog(LOG_INFO, std::to_string(px).c_str());

     qmlRegisterType<HelloCpp>("HelloCpp", 1, 0, "HelloCpp");


    return AsteroidApp::main(argc, argv);
}
