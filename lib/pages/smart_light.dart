import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_svg/svg.dart';
import '../model/lamp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Lamp için Hive adaptörünü kaydet
  Hive.registerAdapter(LampAdapter());

  // Lamp kutusunu aç
  await Hive.openBox<Lamp>('lamps');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmartLight(),
    );
  }
}

class SmartLight extends StatefulWidget {
  const SmartLight({super.key});

  @override
  State<SmartLight> createState() => _SmartLightState();
}

class _SmartLightState extends State<SmartLight> {
  Lamp lamp = Lamp("AA:BB:CC:DD:EE:FF", "Akıllı Lamba", "Model XYZ", true);

  @override
  void initState() {
    super.initState();
    // Veritabanından lamp verilerini al
    _getLampFromDatabase();
  }

  void _getLampFromDatabase() async {
    final lampBox = Hive.box<Lamp>('lamps');
    lamp = lampBox.get('lamp1', defaultValue: lamp)!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Smart Light",
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.grey[800]),
        actions: [
          Switch(
            value: lamp.status,
            onChanged: (value) {
              setState(() {
                lamp.status = value;
              });
              _saveLampToDatabase(lamp); // Veritabanına kaydet
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              lamp.status
                  ? "assets/images/light_on.svg"
                  : "assets/images/light_off.svg",
              height: 150,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Text(
              "Light Status: ${lamp.status ? "On" : "Off"}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _saveLampToDatabase(Lamp lamp) async {
    final lampBox = Hive.box<Lamp>('lamps');
    await lampBox.put('lamp1', lamp);
  }
}
