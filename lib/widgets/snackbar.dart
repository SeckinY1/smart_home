import 'package:flutter/material.dart';

void snackBar(BuildContext context, String text,
    {Color bgColor = Colors.red, int seconds = 5, bool noAction = false}) {
  final snackBar = SnackBar(
    backgroundColor: bgColor,
    content: Text(text),
    duration: Duration(seconds: seconds),
    action: noAction
        ? null
        : SnackBarAction(
            textColor: Colors.white,
            label: "Kapat",
            onPressed: () {},
          ),
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
