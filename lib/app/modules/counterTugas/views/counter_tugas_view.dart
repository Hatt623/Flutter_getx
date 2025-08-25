import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_tugas_controller.dart';

class CounterTugasView extends GetView<CounterTugasController> {
   const CounterTugasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('CounterTugasView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            Obx(() 
            => Text(
              "Hitungan ke:${controller.number.toString()}",
              style: TextStyle(fontSize: controller.number.toDouble()),
            )),
            Text("test"),
            ElevatedButton(
                onPressed: controller.increment, child: Text("increment"))
          ],
        ),
      ),
    );
  }
}
