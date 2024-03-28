import 'dart:io';

import 'package:data_kontak/class/kontak.dart';
import 'package:data_kontak/controller/kontak_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormKontak extends StatefulWidget {
  const FormKontak({super.key});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  File? _image;
  final _imagePicker = ImagePicker();

  final _formkey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noTeleponController = TextEditingController();

  Future<void> getImage() async {
    final XFile? pickerFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickerFile != null) {
          _image = File(pickerFile.path);
        } else {
          print("No image selected");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nama", hintText: "Masukkan Nama"),
                controller: _namaController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email", hintText: "Masukkan Email"),
                controller: _emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Alamat", hintText: "Masukkan Alamat"),
                controller: _alamatController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "No Telepon", hintText: "Masukkan No Telepon"),
                controller: _noTeleponController,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _image == null
                ? const Text("Tidak ada gambar yang dipilih")
                : Image.file(_image!),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 35),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Text("Pilih Gambar"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    var result = await KontakController().addPerson(
                        Kontak(
                            nama: _namaController.text,
                            email: _emailController.text,
                            alamat: _alamatController.text,
                            noTelepon: _noTeleponController.text,
                            foto: _image!.path),
                        _image);
                  }
                },
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
