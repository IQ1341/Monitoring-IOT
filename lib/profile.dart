// profile.dart

import 'package:flutter/material.dart';
import 'navbar.dart'; // Import the CustomBottomNavBar

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProfileContent(), // Centered profile content
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            // Navigate to the home page
            Navigator.pop(context);
          } else if (index == 1) {
            // Stay on the profile page
          }
        },
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40), // Tambahkan jarak ke bagian atas
          Text(
            'Monitoring IOT',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 132, 97, 97),
            ),
          ),
          Image.asset(
            'assets/smart-home.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 70.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 239, 242),
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: MediaQuery.of(context).size.width * 0.8, // Ubah nilai sesuai kebutuhan
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Container(
                  width: 140, // Ubah nilai sesuai kebutuhan
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Mahgdalena Cristine Jayanti',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'E32222306',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Teknik Komputer',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Color.fromARGB(0xFF, 0x22, 0x25, 0x38),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
