import 'package:get/get.dart';

import '../controllers/counter_tugas_controller.dart';

class CounterTugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterTugasController>(
      () => CounterTugasController(),
    );
  }
}
