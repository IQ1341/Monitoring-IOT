import 'package:flutter/material.dart';
import 'first.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah beberapa detik, navigasi ke halaman pertama
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo atau gambar SplashScreen di sini
            Image.asset(
              'assets/smart-home.png',
              width: 150.0, // Sesuaikan lebar gambar
              height: 150.0, // Sesuaikan tinggi gambar
            ),
            SizedBox(height: 16.0),
            // Tambahkan animasi atau elemen lain jika diperlukan
            SpinKitWave(
              color: Color.fromARGB(255, 132, 97, 97),
              size: 50.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'SMART HOME IOT',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
                fontSize: 24.0,
                color: Color.fromARGB(255, 132, 97, 97),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
