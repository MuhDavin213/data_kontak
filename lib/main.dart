import 'package:data_kontak/screen/homeView.dart';
import 'package:data_kontak/widget/form_kontak.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Selamat Malam'),
          backgroundColor: Colors.amber,
        ),
        body: const FormKontak(),
      ),
    );
  }
}
