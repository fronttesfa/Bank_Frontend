import 'package:flutter/material.dart';

SnackBar customSnackBar(String text, Duration duration) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    duration: duration,
  );
}
