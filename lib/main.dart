/// Copyright 2022 The 1645 Authors. All rights reserved.
/// Snapshot 22w02c belongs to Version 0.0.1 alpha 1.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/module/splash/splash_page.dart';
import 'package:mccp_1645/route/export.dart';

import 'config/binding.dart';

void main() => runApp(const MusicalCoCreatingApp());

class MusicalCoCreatingApp extends StatelessWidget {
  const MusicalCoCreatingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '1645',
      initialRoute: Routes.splash,
      initialBinding: RootBinding(),
      defaultTransition: Transition.zoom,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
