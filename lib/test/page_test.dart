import 'package:flutter/material.dart';
import 'package:mccp_1645/module/tab/sub/repository/repo_manager.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RepositoryManager(),
    );
  }
}
