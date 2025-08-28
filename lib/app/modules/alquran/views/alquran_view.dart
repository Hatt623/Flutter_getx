import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiirpl1getx/app/modules/alquran/views/alquran_detail_view.dart';

import '../controllers/alquran_controller.dart';

class AlquranView extends GetView<AlquranController> {
  AlquranView({Key? key}) : super(key: key);
  final controller = Get.put<AlquranController>(AlquranController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alquran')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchAlquran,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final alqurans = controller.alqurans;
        if (alqurans.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: alqurans.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final alquran = alqurans[i];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  alquran.nomor, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(alquran.asma),
              subtitle: Text(
                alquran.nama,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => AlquranDetailView(alquran: alquran)),
            );
          },
        );
      }),
    );
  }
}

