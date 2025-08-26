import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // pemanggilan controller
    final FormPendaftaranController controller = Get.put(FormPendaftaranController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPendaftaranView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.8),
          child: Column(
            children: [

              // name field
              Obx(() => 
                TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                    // print(controller.name); //testing
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama lengkap',
                    errorText: controller.nameError.value.isNotEmpty 
                                ? controller.nameError.value : null,
                  ),
                )
              ),
              SizedBox(height: 20,),

              // gender dropdown
              Obx(() => 
                DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty ? null : controller.gender.value ,
                  hint: Text('pilih jenis kelamin'),
                  items: ['pria', 'wanita']
                    .map((gender) => DropdownMenuItem( //.map untuk looping data item 
                    value: gender,
                    child: Text(gender),
                  ))
                    .toList(),

                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                    controller.validateGender(gender: value);
                  },

                  decoration: InputDecoration(
                    labelText: 'jenis kelamin',
                    errorText: controller.genderError.value.isNotEmpty ? controller.genderError.value : null,
                  ),
                )
              ),
              SizedBox(height: 20,),

              //field tanggal lahir
              Obx(() => 
                ListTile(
                  title: Text(
                    controller.dateOfBirth.value == null ? 
                      'pilih tanggal lahir'  : DateFormat('dd-mm-yyyy').format(controller.dateOfBirth.value!)
                    ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now()
                    );

                    if (selectedDate != null){
                      controller.dateOfBirth.value = selectedDate;
                      controller.validateDateOfBirth(dateOfBirth:selectedDate);
                    }
                  },

                  subtitle: controller.dateOfBirthError.value.isNotEmpty 
                    ? Text(
                      controller.dateOfBirthError.value,
                      style: TextStyle(color: Colors.redAccent),
                    )
                    : null
                ),
              ),
              SizedBox(height: 20,),

              Obx(() => 
                // phone field
                TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                    // print(controller.phone); //testing
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'nomor telepon',
                    errorText: controller.phoneError.value.isNotEmpty 
                                ? controller.phoneError.value : null,
                  ),
                )
              ),
              SizedBox(height: 20,),

              // tombol submit
              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                }, 
                child: Text('submit')
              ),

            ],
          ),
        ),
      )
    );
  }
}
