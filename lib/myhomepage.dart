import 'package:flutter/material.dart';
import 'package:smart_energy_managment_mobile_app/ampul_page.dart';
import 'package:smart_energy_managment_mobile_app/fanpage.dart';
import 'package:smart_energy_managment_mobile_app/temperaturepage.dart';
import 'package:smart_energy_managment_mobile_app/powerconsumptionpage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF31363F),
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        elevation: 0,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Logo en sağa yaslanacak
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Akıllı Enerji Yönetimi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Yavuz Selim Tokdemir',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ],
            ),
            Image.asset(
              'icons/logo.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AmpulPage()),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      color: Color(0xFF393E46),
                      child: Center(
                        child: Image.asset(
                          'icons/light-bulb.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FanPage()),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      color: Color(0xFF393E46),
                      child: Center(
                        child: Image.asset(
                          'icons/fan.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemperaturePage(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      color: Color(0xFF393E46),
                      child: Center(
                        child: Image.asset(
                          'icons/temperature.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PowerConsumptionPage(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      color: Color(0xFF393E46),
                      child: Center(
                        child: Image.asset(
                          'icons/energy-consumption.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
