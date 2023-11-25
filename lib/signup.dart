import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
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
                SizedBox(height: 16.0),
                _buildTextField('Email', _emailController),
                SizedBox(height: 16.0),
                _buildTextField('Password', _passwordController, isPassword: true),
                SizedBox(height: 16.0),
                _buildTextField(
                  'Confirm Password',
                  _confirmPasswordController,
                  isPassword: true,
                ),
                SizedBox(height: 32.0),
                _buildSignupButton(context),
                SizedBox(height: 16.0),
                _buildLoginLink(),
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
    return TextField(
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
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_validateInputs()) {
          // Signup menggunakan Firebase Auth
          try {
            UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );

            if (result.user != null) {
              // Signup berhasil, navigasi ke halaman utama
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else {
              // Tampilkan pesan error jika signup gagal
              setState(() {
                _errorText = 'Terjadi kesalahan. Silakan coba lagi.';
              });
            }
          } catch (e) {
            print('Error during signup: $e');
            // Tampilkan pesan error jika signup gagal
            setState(() {
              _errorText = 'Terjadi kesalahan. Silakan coba lagi.';
            });
          }
        }
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
    );
  }

 Widget _buildLoginLink() {
    return RichText(
      text: TextSpan(
        text: 'Sudah punya akun? ',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12.0,
          color: Colors.black, // Warna teks biasa
        ),
        children: [
          TextSpan(
            text: 'Masuk',
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      setState(() {
        _errorText = 'Semua field harus diisi.';
      });
      return false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorText = 'Password dan konfirmasi password tidak cocok.';
      });
      return false;
    }

    return true;
  }
}
