import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FanPage extends StatefulWidget {
  @override
  _FanPageState createState() => _FanPageState();
}

class _FanPageState extends State<FanPage> {
  bool _isOn = false; // Fanın başlangıçta kapalı olduğunu varsayalım

  // Firebase veritabanı referansını oluşturur
  final DatabaseReference _fanStateRef =
      FirebaseDatabase.instance.reference().child('fan_state');

  void _toggleFanState() {
    setState(() {
      _isOn = !_isOn;
    });

    // Değeri Firebase veritabanına gönder (true = açık, false = kapalı)
    _fanStateRef.set(_isOn ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF31363F),
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        elevation: 0,
        title: Text('Fan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleFanState,
              child: Text(_isOn ? 'Kapat' : 'Aç'),
            ),
          ],
        ),
      ),
    );
  }
}
