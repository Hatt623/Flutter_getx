import 'package:get/get.dart';

class CounterTugasController extends GetxController {
  //TODO: Implement CounterTugasController

  RxInt number = 20.obs;
  void increment(){
    if (number < 100) {
      number ++;
      Get.snackbar("Number:", "your number is ${number}");
    }

    else {
      Get.snackbar("Number:", "Your number:${number}");
    }
  }
}
