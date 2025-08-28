import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiirpl1getx/app/modules/alquran/views/alquran_view.dart';
import 'package:xiirpl1getx/app/modules/counter/views/counter_view.dart';
import 'package:xiirpl1getx/app/modules/form_pendaftaran/views/form_pendaftaran_view.dart';
import 'package:xiirpl1getx/app/modules/post/views/post_view.dart';
import 'package:xiirpl1getx/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> { //controller
  HomeView({Key? key}) : super(key: key);

  final List<Widget> pages = [CounterView(), PostView(),AlquranView(),FormPendaftaranView(),ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Getx'),
        centerTitle: true,
      ),
      body: 
      Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.photo_album_sharp, title: 'Post'),
          TabItem(icon: Icons.book, title: 'Alquran'),
          TabItem(icon: Icons.receipt, title: 'Form'),
          TabItem(icon: Icons.person_rounded, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: controller.changePage,
      ),
      // Center(
      //   child: Column(
      //     children: [
      //       Text('HomeView is working',style: TextStyle(fontSize: 20),),
      //       ElevatedButton(
      //         onPressed: () => Get.toNamed('/counter'),
      //         child: Text('Go to counter')
      //       ),
      //       SizedBox(height: 20,),
      //       ElevatedButton(
      //         onPressed: () => Get.toNamed('/counter-tugas'),
      //         child: Text('Go to counterTugas')
      //       ),
      //       SizedBox(height: 20,),

      //       // Container(
      //       //   child: InkWell(
      //       //     onTap: Get.to(() => FormPendaftaranView()),
      //       //   ),
      //       // ),
      //       ElevatedButton(
      //          onPressed: () => Get.toNamed('/form-pendaftaran'),
      //       child: Text('Go to form perndaftaran')
      //       ),
      //       SizedBox(height: 20,),

      //       ElevatedButton(
      //          onPressed: () => Get.toNamed('/post'),
      //       child: Text('Go to post')
      //       ),
      //       SizedBox(height: 20,),

      //       ElevatedButton(
      //          onPressed: () => Get.toNamed('/alquran'),
      //       child: Text('Go to alquran')
      //       ),
      //       SizedBox(height: 20,),

      //     ],
      //   ),
      // ),
    );
  }
}
