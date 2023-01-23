import 'package:flutter/material.dart';
import 'package:moda_app_ui/helper/constants/constansts.dart';
import 'package:moda_app_ui/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moda',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}








