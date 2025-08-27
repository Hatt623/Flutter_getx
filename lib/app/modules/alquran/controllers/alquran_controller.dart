import 'package:get/get.dart';
import 'package:xiirpl1getx/app/data/models/alquran.dart';
import 'package:xiirpl1getx/app/services/alquran_service.dart';

class AlquranController extends GetxController {
  //TODO: Implement AlquranController

   final AlquranService _alquranService = Get.put<AlquranService>(AlquranService());

  RxList alqurans = <Alquran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit(){
    super.onInit();
    fetchAlquran();
  }

  void fetchAlquran() async {
    try{
      isLoading(true);
      errorMessage('');

      final response = await _alquranService.fetchAlqurans();
      if (response.statusCode == 200) {
        var postList = response.body!
          .map((postJson) => Alquran.fromJson(postJson))
          .toList();
        alqurans.assignAll(postList);
      }
      else {  
        errorMessage('Error: ${response.statusText}');
      }
    }

    catch (e) {
      errorMessage('Exception: $e');
    }

    finally {
      isLoading(false);
    }
  }
}
