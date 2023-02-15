import 'package:flutter/material.dart';
import 'package:uniprovider/ui_page/classTerm_page.dart';
import 'package:uniprovider/ui_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ClassTermPage(),
    );
  }
}


