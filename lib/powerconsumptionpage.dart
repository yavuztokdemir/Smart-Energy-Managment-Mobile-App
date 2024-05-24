import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PowerConsumptionPage extends StatefulWidget {
  @override
  _PowerConsumptionPageState createState() => _PowerConsumptionPageState();
}

class _PowerConsumptionPageState extends State<PowerConsumptionPage> {
  late DatabaseReference _ledAmperRef;
  late DatabaseReference _voltageRef;
  late DatabaseReference _powerRef;
  double ledAmperValue = 0;
  double voltageValue = 0;
  double powerValue = 0;

  @override
  void initState() {
    super.initState();
    _ledAmperRef = FirebaseDatabase.instance.reference().child('LedAmper');
    _voltageRef = FirebaseDatabase.instance.reference().child('Voltage');
    _powerRef = FirebaseDatabase.instance.reference().child('Power');
    _ledAmperRef.onValue.listen((event) {
      setState(() {
        ledAmperValue = double.tryParse(event.snapshot.value.toString()) ?? 0;
      });
    });
    _voltageRef.onValue.listen((event) {
      setState(() {
        voltageValue = double.tryParse(event.snapshot.value.toString()) ?? 0;
      });
    });
    _powerRef.onValue.listen((event) {
      setState(() {
        powerValue = double.tryParse(event.snapshot.value.toString()) ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF31363F),
      appBar: AppBar(
        title: Text('Güç Tüketimi'),
        backgroundColor: Color(0xFF222831),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('icons/light-bulb.png'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildData('icons/volt.png', 'Gerilim', voltageValue),
                SizedBox(width: 20),
                _buildData('icons/amper.png', 'Akım', ledAmperValue),
                SizedBox(width: 20),
                _buildData('icons/watt.png', 'Güç', powerValue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildData(String imagePath, String label, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(imagePath),
        ),
        SizedBox(height: 10),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
