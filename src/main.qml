/*
 * Copyright (C) 2019 Florent Revest <revestflo@gmail.com>
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

import QtQuick 2.9
import org.asteroid.controls 1.0
import QtSensors 5.3

Application {
    id: app

    centerColor: "#4D6E93"
    outerColor: "#233243"

    Gyroscope {
        id: gyroscope
        active: true
        dataRate: 25

        property variant lastTimeStamp: 0

        property real x: 0
        property real y: 0
        property real z: 0

        onReadingChanged: {

            x = reading.x
            y = reading.y
            z = reading.z

                    
            gyroX.text = "x:" + Math.round(reading.x)
            gyroY.text = "y:" + Math.round(reading.y)
            gyroZ.text = "z:" + Math.round(reading.z)
          
        }
    }

    Label{
        id: gyroLabel
        anchors {
            centerIn: app
            horizontalCenterOffset: -125
            verticalCenterOffset: -30
        }
        text: "Gyro:"
    }
    
    Label {
        id: gyroX
        anchors {
            centerIn: app
            horizontalCenterOffset: -125
            verticalCenterOffset: 0
        }
        
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }
    Label {
        id: gyroY
        anchors {
            centerIn: app
            horizontalCenterOffset: -125
            verticalCenterOffset: 30
        }
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }
    Label {
        id: gyroZ
        anchors {
            centerIn: app
            horizontalCenterOffset: -125
            verticalCenterOffset: 60
        }
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }

    Accelerometer {
        id: accelerometer
        active: true
        dataRate: 25

        property real x: 0
        property real y: 0
        property real z: 0

        onReadingChanged: {
            x = reading.x
            y = reading.y
            z = reading.z
            
            accelX.text = "x:" + Math.round(reading.x)
            accelY.text = "y:" + Math.round(reading.y)
            accelZ.text = "z:" + Math.round(reading.z)
            }
    }
    Label{
        id: accelLabel
        anchors {
            centerIn: app
            horizontalCenterOffset: -50
            verticalCenterOffset: -30
        }
        text: "Accel:"
    }
    Label {
        id: accelX
        anchors {
            centerIn: app
            horizontalCenterOffset: -50
            verticalCenterOffset: 0
        }
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }
    Label {
        id: accelY
        anchors {
            centerIn: app
            horizontalCenterOffset: -50
            verticalCenterOffset: 30
        }
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }
    Label {
        id: accelZ
        anchors {
            centerIn: app
            horizontalCenterOffset: -50
            verticalCenterOffset: 60
        }
        horizontalAlignment: Text.AlignHCenter
        text: ""
    }



    // CompassSensor {
    //     id: CompassSensor
    //     onReadingChanged:{

    //     }
    // }
    // AmbientLightSensor {
    //     id: ambientlight
    //     active: false
    //     onReadingChanged: {
    //         if (reading.lightLevel == AmbientLightReading.Dark)
    //             lightStatus.text = "Ambient light: Dark";
    //         else if (reading.lightLevel == AmbientLightReading.Twilight)
    //             lightStatus.text = "Ambient light: Twilight";
    //         else if (reading.lightLevel == AmbientLightReading.Light)
    //             lightStatus.text = "Ambient light: Light";
    //         else if (reading.lightLevel == AmbientLightReading.Bright)
    //             lightStatus.text = "Ambient light: Bright";
    //         else if (reading.lightLevel == AmbientLightReading.Sunny)
    //             lightStatus.text = "Ambient light: Sunny";
    //         else
    //             lightStatus.text = "Ambient light: Unknown";
    //     }
    // }
    // Label{
    //     id: lightLabel
    //     anchors {
    //         centerIn: app
    //         horizontalCenterOffset: 0
    //         verticalCenterOffset: 130
    //     }
    //     text: "Light:"
    // }
    // Label {
    //     id: lightStatus
    //     anchors {
    //         centerIn: app
    //         horizontalCenterOffset: 0
    //         verticalCenterOffset: 100
    //     }
    //     horizontalAlignment: Text.AlignHCenter
    //     text: ""
    // }


    
    // Spinner {
    //         id: minuteLV
    //         currentIndex: 1
    //         enabled: !timer.running
    //         height: parent.height
    //         width: parent.width * 0.505
    //         model: 60
    //         // highlightMoveDuration: currentIndex != 0 ? 400 : 0
    //         // onCurrentIndexChanged: if(enabled) seconds = secondLV.currentIndex + 60*minuteLV.currentIndex + 3600*hourLV.currentIndex
    //     }


    
}
