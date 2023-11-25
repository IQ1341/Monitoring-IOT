// login.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'signup.dart'; // Import your signup page file
import 'utama.dart'; // Import your main page file
import 'auth.dart'; // Import your authentication logic


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/smart-home.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
              child: Text(
                'SMART HOME IOT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 132, 97, 97),
                ),
              ),
            ),
                SizedBox(height: 40.0),
                _buildTextField('Email', _emailController),
                SizedBox(height: 16.0),
                _buildTextField('Password', _passwordController, isPassword: true),
                SizedBox(height: 16.0),
                _buildLoginButton(context),
                SizedBox(height: 16.0),
                _buildSignupLink(),
                SizedBox(height: 16.0),
                Text(
                  _errorText,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildTextField(String label, TextEditingController controller,
    {bool isPassword = false}) {
  return Container(
    width: double.infinity, // Kolom mengambil lebar maksimum
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget _buildLoginButton(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      if (_validateInputs()) {
        // Login menggunakan Firebase Auth
        Auth auth = Auth();
        UserCredential? result = await auth.signIn(
          _emailController.text,
          _passwordController.text,
        );

        if (result != null) {
          // Login berhasil, navigasi ke halaman utama
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UtamaPage()),
          );
        } else {
          // Tampilkan pesan error
          setState(() {
            _errorText = 'Email atau password tidak valid. Silakan coba lagi.';
          });
        }
      }
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: 300,
      height: 45.0,
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
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 132, 97, 97),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

  Widget _buildSignupLink() {
    return RichText(
      text: TextSpan(
        text: 'Belum punya akun? ',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12.0,
          color: Colors.black, // Warna teks biasa
        ),
        children: [
          TextSpan(
            text: 'Daftar',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.0,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigasi ke halaman signup
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
          ),
        ],
      ),
    );
  }

  bool _validateInputs() {
    // Implementasi validasi input sesuai kebutuhan
    // Misalnya, periksa apakah email memiliki format yang benar

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      // Tampilkan pesan error
      setState(() {
        _errorText = 'Email dan password harus diisi.';
      });
      return false;
    }

    return true;
  }
}
