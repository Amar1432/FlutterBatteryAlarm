import 'package:battery_alarm/controller/batteryController.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BatteryController batteryController = Get.put(BatteryController());
    var battery = Battery();
    
    // checkBattery() async {
    //   batteryController.batteryStatus.value = await battery.batteryLevel;
    // }

    // checkBattery();

    battery.onBatteryStateChanged.listen((event) {
      if (event == BatteryState.charging) {
        batteryController.chargingMsg.value =
            "You plugged in charger your phone is now charging";
      } else if (event == BatteryState.discharging) {
        batteryController.chargingMsg.value =
            "Your mobile is discharging only ${batteryController.batteryStatus.value} left";
      } else if (event == BatteryState.full) {
        print('Battery Full');
      } else if (event == BatteryState.unknown) {
        print('Something went wrong can not display battery data');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Alarm'),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batteryController.batteryStatus.toString(),
            ),
            Text(batteryController.chargingMsg.value),
          ],
        ),
      )),
    );
  }
}
