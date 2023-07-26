// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../pages/smart_light.dart';
import '../pages/smart_stove.dart';

class SmartDeviceBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final String pageName;

  const SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.pageName,
  });

  @override
  State<StatefulWidget> createState() => SmartDeviceBoxState();
}

class SmartDeviceBoxState extends State<SmartDeviceBox> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          if (widget.pageName == 'SmartLight') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SmartLight(),
              ),
            );
          } else if (widget.pageName == 'SmartStove') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SmartStove(),
              ),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Image.asset(
                widget.iconPath,
                height: 65,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                widget.smartDeviceName,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
