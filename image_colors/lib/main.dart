import 'package:flutter/material.dart';
import 'package:image_colors/image_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageColor(),
    );
  }
}

