import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../model/stove.dart';

class SmartStove extends StatefulWidget {
  const SmartStove({super.key});

  @override
  State<SmartStove> createState() => _SmartStoveState();
}

class _SmartStoveState extends State<SmartStove> {
  Stove stove =
      Stove("AA:BB:CC:DD:EE:FF", "Akıllı Fırın", "Model XYZ", false, 34.0);

  @override
  void initState() {
    super.initState();
    // Veritabanındaki kutudan veriyi çek
    _getStoveFromDatabase();
  }

  void _getStoveFromDatabase() async {
    final stoveBox = Hive.box<Stove>('stoves');
    stove = stoveBox.get('stove1', defaultValue: stove)!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Smart Stove",
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: Colors.grey[300],
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
        actions: [
          Switch(
            value: stove.status,
            onChanged: (value) {
              setState(() {
                stove.status = value;
              });
              _saveStoveToDatabase(stove); // Veritabanına kaydet
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            CircularPercentIndicator(
              radius: 180,
              lineWidth: 14,
              percent: stove.status ? stove.temperature / 100 : 0,
              center: Text(
                stove.status ? "${stove.temperature.toInt()}\u00B0" : "0\u00B0",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Heating",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    Slider(
                      thumbColor: Colors.red,
                      activeColor: Colors.red,
                      value: stove.temperature,
                      onChanged: (newTemperature) {
                        setState(() {
                          stove.temperature = newTemperature;
                        });
                        _saveStoveToDatabase(stove); // Veritabanına kaydet
                      },
                      max: 100,
                      min: 0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _saveStoveToDatabase(Stove stove) async {
    final stoveBox = Hive.box<Stove>('stoves');
    await stoveBox.put('stove1', stove);
  }
}
