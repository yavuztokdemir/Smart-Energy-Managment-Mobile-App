import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AmpulPage extends StatefulWidget {
  @override
  _AmpulPageState createState() => _AmpulPageState();
}

class _AmpulPageState extends State<AmpulPage> {
  bool lightState = false; // Ampulün başlangıçta kapalı olduğunu varsayalım
  bool motionDetectionMode = false; // Hareket algılama modu

  Future<void> updateLightState(bool state) async {
    // Firebase Realtime Database referansı oluştur
    final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

    // Firebase Realtime Database'e ışık durumunu güncelle
    await databaseRef.child('light').set(state ? 1 : 0);

    // setState ile yeniden çizimi tetikle
    setState(() {
      lightState = state;
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
      body: Center(
        // Wrap the column with Center widget
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Already set for vertical centering
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateLightState(!lightState);
              },
              child: Text(
                lightState ? 'Kapat' : 'Aç',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateMotionDetectionMode(!motionDetectionMode);
              },
              child: Text(
                motionDetectionMode ? 'Motion Off' : 'Motion On',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
