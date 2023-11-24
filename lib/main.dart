import 'package:flutter/material.dart';
import 'utama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blynk App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UtamaPage(),
      debugShowCheckedModeBanner: false, // Menetapkan ini ke false untuk menghilangkan label debug
    );
  }
}
