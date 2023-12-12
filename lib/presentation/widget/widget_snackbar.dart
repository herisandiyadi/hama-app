import 'package:flutter/material.dart';

void widgetsnackbar(BuildContext context, String message, Color backColor) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    backgroundColor: backColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
