import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AmpulPage extends StatefulWidget {
  @override
  _AmpulPageState createState() => _AmpulPageState();
}

class _AmpulPageState extends State<AmpulPage> {
  int brightnessPercentage = 0; // Başlangıçta parlaklık yüzdesi 0
  bool motionDetectionMode = false; // Hareket algılama modu

  Future<void> updateBrightness(double percentage) async {
    // Yüzde değerini tam sayıya yuvarla
    int brightnessValue = percentage.round();

    // Firebase Realtime Database referansı oluştur
    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

    // Firebase Realtime Database'e parlaklık değerini güncelle
    await databaseRef.child('brightness').set(brightnessValue);

    // setState ile yeniden çizimi tetikle
    setState(() {
      brightnessPercentage = brightnessValue;
    });
  }

  Future<void> updateMotionDetectionMode(bool mode) async {
    // Firebase Realtime Database referansı oluştur
    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

    // Firebase Realtime Database'e hareket algılama modunu güncelle
    await databaseRef.child('motion').set(mode ? 1 : 0);

    // setState ile yeniden çizimi tetikle
    setState(() {
      motionDetectionMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF31363F),
      appBar: AppBar(
        title: Text('Ampül'),
        backgroundColor: Color(0xFF222831),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Hareket algılama modunu güncelle
              updateMotionDetectionMode(!motionDetectionMode);
            },
            child: Text(
              motionDetectionMode ? 'Motion Off' : 'Motion On',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Parlaklık: $brightnessPercentage%', // Kullanıcıya seçtiği yüzde değerini göster
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Slider(
                  value: brightnessPercentage.toDouble(),
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    // Parlaklık yüzdesi değiştiğinde updateBrightness metodunu çağır
                    updateBrightness(value);
                  },
                  activeColor: Color.fromARGB(255, 118, 171, 174),
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
