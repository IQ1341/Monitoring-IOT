// utama.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'api.dart';
import 'navbar.dart';
import 'profile.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  CustomContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: child,
    );
  }
}

class UtamaPage extends StatefulWidget {
  @override
  _UtamaPageState createState() => _UtamaPageState();
}

class _UtamaPageState extends State<UtamaPage> {
  int currentIndex = 0;
  bool isLedOn = false;
  double brightness = 0.0;

  String temperatureImage = 'assets/suhu.png';
  String humidityImage = 'assets/kelembaban.png';
  String ldrImage = 'assets/cahaya.png';

  int? temperature;
  int? humidity;
  int? ldrValue;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      fetchData();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void fetchData() async {
    try {
      int? newTemperature = await BlynkApi.getTemperature();
      int? newHumidity = await BlynkApi.getHumidity();
      int? newLdrValue = await BlynkApi.getLdrValue();

      setState(() {
        temperature = newTemperature;
        humidity = newHumidity;
        ldrValue = newLdrValue;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void toggleLed(bool value) {
    setState(() {
      isLedOn = value;
      BlynkApi.toggleLed(isLedOn, 1);
    });
  }

  void setBrightness(double value) {
    setState(() {
      brightness = value;
      BlynkApi.setBrightness(brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
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
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'LED',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 18,
                            color: const Color.fromARGB(255, 121, 33, 243),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: isLedOn,
                          onChanged: toggleLed,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Slider(
                          value: brightness,
                          onChanged: setBrightness,
                          min: 0,
                          max: 255,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        temperatureImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temperature',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          '${temperature ?? 0} °C',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        humidityImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 45, 200, 243),
                          ),
                        ),
                        Text(
                          '${humidity ?? 0} %',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 19, 74, 157),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        ldrImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LDR Value',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 33, 33),
                          ),
                        ),
                        Text(
                          '${ldrValue ?? 0}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 181, 63, 63),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 0) {
            // Navigate to the home page (optional)
          } else if (index == 1) {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
