import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:xiirpl1getx/app/modules/form_pendaftaran/views/form_pendaftaran_view.dart';

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
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => Get.toNamed('/counter-tugas'),
              child: Text('Go to counterTugas')
            ),
            SizedBox(height: 20,),

            // Container(
            //   child: InkWell(
            //     onTap: Get.to(() => FormPendaftaranView()),
            //   ),
            // ),
            ElevatedButton(
               onPressed: () => Get.toNamed('/form-pendaftaran'),
            child: Text('Go to form perndaftaran')
            ),
            SizedBox(height: 20,),

            ElevatedButton(
               onPressed: () => Get.toNamed('/post'),
            child: Text('Go to post')
            ),
            SizedBox(height: 20,),

            ElevatedButton(
               onPressed: () => Get.toNamed('/alquran'),
            child: Text('Go to alquran')
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
