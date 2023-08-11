import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mongo_dart/mongo_dart.dart' hide State;

import 'dart:async';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    super.initState();
    startScreen();
    fetchData();
  }

  final db = Db(
      'mongodb+srv://<pratam>:<pratam>@omega.fcyfti1.mongodb.net/Aquaponics?retryWrites=true&w=majority'); // Update with your connection details
  dynamic fetchedData;

  void fetchData() async {
    await db.open();
    var collection = db.collection('data');

    while (true) {
      fetchedData = await collection.findOne(); // Fetch one data entry

      setState(() {
        // Update the fetched data in the UI
      });

      await Future.delayed(Duration(seconds: 5));
    }
  }

  @override
  void dispose() {
    db.close();
    super.dispose();
  }

  double _temp = 0;
  double _dissolvedOxygen = 2;
  double _ph = 0;
  double _ammonia = 0;
  double _nitrate = 0;

  bool _isIdealTemp = false;
  bool _isIdealDissolvedOxygen = false;
  bool _isIdealPh = false;
  bool _isIdealammoina = false;
  bool _isIdealNitrate = false;

  void startScreen() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_nitrate > 273 && _nitrate < 526) {
        setState(() {
          _isIdealNitrate = true;
        });
      }
      if (_ammonia > 0.00006 && _ammonia < 0.008) {
        setState(() {
          _isIdealammoina = true;
        });
      }
      if (_ph > 6.8 && _ph < 7) {
        setState(() {
          _isIdealPh = true;
        });
      }
      if (_dissolvedOxygen > 1 && _dissolvedOxygen < 5) {
        setState(() {
          _isIdealDissolvedOxygen = true;
        });
      }
      if (_temp > 20 && _temp < 30) {
        setState(() {
          _isIdealTemp = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monitor Parameters"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Parameters",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Concentration",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Temperature"),
                const Spacer(),
                Text(
                  "$_temp",
                  style: TextStyle(
                      color: _isIdealTemp ? Colors.green : Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Dissolved Oxygen"),
                const Spacer(),
                Text(
                  "$_dissolvedOxygen",
                  style: TextStyle(
                      color:
                          _isIdealDissolvedOxygen ? Colors.green : Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("pH"),
                const Spacer(),
                Text(
                  "$_ph",
                  style:
                      TextStyle(color: _isIdealPh ? Colors.green : Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Ammonia"),
                const Spacer(),
                Text(
                  "$_ammonia",
                  style: TextStyle(
                      color: _isIdealammoina ? Colors.green : Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Nitrate"),
                const Spacer(),
                Text(
                  "$_nitrate",
                  style: TextStyle(
                      color: _isIdealNitrate ? Colors.green : Colors.red),
                ),
                Text('Fetched Data: $fetchedData[PH]'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
