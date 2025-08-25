import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  RxInt hitung = 0.obs;

  void increment(){
    if (hitung < 10) {
      hitung ++;
    }

    else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh lebih dari 10",
        backgroundColor: Colors.redAccent,
        icon: Icon(Icons.warning, color: Colors.white,),
        colorText: Colors.white,
      );
    }
  }
}
