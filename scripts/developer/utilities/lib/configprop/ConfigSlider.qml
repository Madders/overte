//
//  ConfigSlider.qml
//
//  Created by Zach Pomerantz on 2/8/2016
//  Copyright 2016 High Fidelity, Inc.
//
//  Distributed under the Apache License, Version 2.0.
//  See the accompanying file LICENSE or https://www.apache.org/licenses/LICENSE-2.0.html
//

import QtQuick 2.7
import QtQuick.Controls 1.4 as Original
import QtQuick.Controls.Styles 1.4

import "../hifi-qml/styles-uit"
import "../hifi-qml/controls-uit" as HifiControls


Item {
    HifiConstants { id: luci }
    id: root

    anchors.left: parent.left
    anchors.right: parent.right    
    height: 24
    property bool integral: false
    property var config
    property string property
    property alias label: labelControl.text
    property alias min: sliderControl.minimumValue
    property alias max: sliderControl.maximumValue

    Component.onCompleted: {
        // Binding favors qml value, so set it first
        sliderControl.value = root.config[root.property];
        bindingControl.when = true;
    }

    HifiControls.Label {
        id: labelControl
        text: root.label
        enabled: true
        anchors.left: root.left
        anchors.right: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        //anchors.topMargin: 7
    }

    HifiControls.Label {
        id: labelValue
        text: sliderControl.value.toFixed(root.integral ? 0 : 2)
        anchors.right: root.right
        anchors.bottom: root.bottom
        anchors.bottomMargin: 0
    }

    Binding {
        id: bindingControl
        target: root.config
        property: root.property
        value: sliderControl.value
        when: false
    }

    HifiControls.Slider {
        id: sliderControl
        stepSize: root.integral ? 1.0 : 0.0
        //height: 20
        anchors.left: root.horizontalCenter
        anchors.right: root.right
        anchors.rightMargin: 0
        anchors.top: root.top
        anchors.topMargin: 0
    }
}
