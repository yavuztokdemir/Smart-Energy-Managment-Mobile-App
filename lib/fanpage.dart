import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FanPage extends StatefulWidget {
  @override
  _FanPageState createState() => _FanPageState();
}

class _FanPageState extends State<FanPage> {
  double _progressValue = 0.0;

  // Firebase veritabanı referansını oluşturur
  final DatabaseReference _fanSpeedRef =
      FirebaseDatabase.instance.reference().child('fan_speed');

  void _updateProgress(double value) {
    setState(() {
      _progressValue = value;
    });

    // Değer 100'e bölünerek Firebase veritabanına gönderilir
    _fanSpeedRef.set((value).toInt());
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
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xFF222831),
                    // Değeri 100'e böldükten sonra kullan
                    value: _progressValue / 100,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Positioned(
                  top: 60.0, // Ayarlama gerektiğinde konumu ayarlayın
                  child: Text(
                    "Fan Hızı",
                    style: TextStyle(
                      fontSize: 24, // Her iki metni de aynı boyuta ayarlayın
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70.0, // Ayarlama gerektiğinde konumu ayarlayın
                  child: Text(
                    "${(_progressValue).toInt()}",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors
                            .white), // Her iki metni de aynı boyuta ayarlayın
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Slider(
              value: _progressValue,
              onChanged: _updateProgress,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.blue,
              inactiveColor: Color(0xFF222831),
            ),
          ],
        ),
      ),
    );
  }
}
