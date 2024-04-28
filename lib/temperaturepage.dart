import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TemperaturePage extends StatefulWidget {
  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  late DatabaseReference _temperatureRef;
  late DatabaseReference _humidityRef;
  double temperatureValue = 0;
  double humidityValue = 0;
  String temperatureStatus = '';
  String humidityStatus = '';

  @override
  void initState() {
    super.initState();
    _temperatureRef =
        FirebaseDatabase.instance.reference().child('temperature');
    _humidityRef = FirebaseDatabase.instance.reference().child('humidity');
    _temperatureRef.onValue.listen((event) {
      setState(() {
        temperatureValue =
            double.tryParse(event.snapshot.value.toString()) ?? 0;
        updateTemperatureStatus(temperatureValue);
      });
    });
    _humidityRef.onValue.listen((event) {
      setState(() {
        humidityValue = double.tryParse(event.snapshot.value.toString()) ?? 0;
        updateHumidityStatus(humidityValue);
      });
    });
  }

  void updateTemperatureStatus(double value) {
    if (value >= 40) {
      temperatureStatus = 'Çok Sıcak';
    } else if (value <= 0) {
      temperatureStatus = 'Çok Soğuk';
    } else {
      temperatureStatus = 'Normal Sıcaklık';
    }
  }

  void updateHumidityStatus(double value) {
    if (value < 40) {
      humidityStatus = 'Nem Çok Az';
    } else if (value > 70) {
      humidityStatus = 'Nem Çok Fazla';
    } else {
      humidityStatus = 'Normal Nem';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF31363F),
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        title: Text('Sıcaklık ve Nem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'icons/heat.png',
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${temperatureValue.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      temperatureStatus,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    Image.asset(
                      'icons/humidity.png',
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${humidityValue.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      humidityStatus,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
