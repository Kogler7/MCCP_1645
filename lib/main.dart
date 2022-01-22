/// Copyright 2022 The 1645 Authors. All rights reserved.
/// Snapshot 22w01b belongs to Version 0.0.1 alpha 1.
import 'package:flutter/material.dart';

import 'page/home.dart';

void main() => runApp(const MusicalCoCreatingApp());

class MusicalCoCreatingApp extends StatelessWidget {
  const MusicalCoCreatingApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
