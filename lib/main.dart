/// Copyright 2022 The 1645 Authors. All rights reserved.
/// Snapshot 22w02a belongs to Version 0.0.1 alpha 1.
import 'package:flutter/material.dart';
import 'package:mccp_1645/introduction/init_screen.dart';

void main() => runApp(const MusicalCoCreatingApp());

class MusicalCoCreatingApp extends StatelessWidget {
  const MusicalCoCreatingApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1645',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedIntroductionScreen(),
    );
  }
}
