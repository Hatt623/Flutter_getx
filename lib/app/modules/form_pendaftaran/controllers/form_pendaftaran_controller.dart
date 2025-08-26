import 'package:get/get.dart';
import 'package:xiirpl1getx/app/modules/form_pendaftaran/views/results_screen_view.dart';

class FormPendaftaranController extends GetxController {
  //TODO: Implement FormPendaftaranController

  // variabel interaktif untuk field from 
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  // variabel interaktif untuk Error validation 
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  // fungsi validasi name
  void validateName({required String name}){
    if (name.length < 3){
      nameError.value = 'nama minimal 3 karakter';
    }

    else if (name.length > 6){
      nameError.value = 'nama maksimal 6 karakter';
    }

    else {
      nameError.value = '';
    }

  }

  // fungsi validasi gender
  void validateGender({required String? gender}){
    if (gender == null || gender.isEmpty){
      genderError.value = 'pilih jenis kelamin';
    }

    else {
      genderError.value = '';
    }

  }

  // fungsi validasi dateOfBirth
  void validateDateOfBirth({required DateTime? dateOfBirth}){
    if (dateOfBirth == null){
      dateOfBirthError.value = 'pilih tanggal lahir';
    }

    else {
      final now = DateTime.now();
      final age = now.year - dateOfBirth.year;
      if (age < 2) {
        dateOfBirthError.value = 'umur minimal 2 tahun';

      }

      else {
        dateOfBirthError.value = '';
      }
    }

  }

  // fungsi validasi hpone
  void validatePhone({required String phone}){
    if (!GetUtils.isPhoneNumber(phone)){
      phoneError.value = 'Nomor telephone tidak aktif';
    }

    else {
      phoneError.value = '';
    }

  }

  // submit form
  void submitForm(){
    validateName(name: name.value);
    validateGender(gender: gender.value);
    validateDateOfBirth(dateOfBirth: dateOfBirth.value);
    validatePhone(phone: phone.value);

    if(nameError.value.isEmpty && genderError.value.isEmpty && genderError.value.isEmpty && phoneError.value.isEmpty){
      Get.to(
        () => ResultsScreenView (
          name: name.value,
          gender: gender.value,
          dateOfBirth: dateOfBirth.value!,
          phone: phone.value,
        ),
      );
    }
    // else {}
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
