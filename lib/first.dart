import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'WELCOME TO',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 132, 97, 97),
                ),
              ),
            ),
            Container(
              child: Text(
                'SMART HOME IOT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 132, 97, 97),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/smart-home.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.0), // Adjust the space between the image and description

            // Wrap the Text widget with a Container to set max width
            Container(
              constraints: BoxConstraints(maxWidth: 300.0), // Adjust the max width as needed
              child: Text(
                'Selamat datang di Smart Home IoT, aplikasi pintar yang memberikan Anda kendali penuh atas perangkat di rumah Anda. Dengan Smart Home IoT, Anda dapat mengontrol lampu, pintu, kamera keamanan, dan banyak lagi, semua dari ujung jari Anda. Nikmati kenyamanan dan keamanan dengan teknologi terkini.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 22, 25, 38),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 42.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: 45.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 132, 97, 97),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                height: 45.0,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 169, 184),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
