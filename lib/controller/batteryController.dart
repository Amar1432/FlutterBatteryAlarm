import 'package:battery_plus/battery_plus.dart';
import 'package:get/get.dart';

class BatteryController extends GetxController {
  var battery = Battery();
  var batteryStatus = 0.obs;
  var chargingMsg = "".obs;

  @override
  void onInit() async {
    batteryStatus.value = await battery.batteryLevel;
    super.onInit();
  }
}
