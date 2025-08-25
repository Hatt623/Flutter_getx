import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> { //controller
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('HomeView is working',style: TextStyle(fontSize: 20),),
            ElevatedButton(
              onPressed: () => Get.toNamed('/counter'),
              child: Text('Go to counter')
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/counter-tugas'),
              child: Text('Go to counterTugas')
            ),
          ],
        ),
      ),
    );
  }
}
