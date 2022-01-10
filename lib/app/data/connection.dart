import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class Connection extends GetxController {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
