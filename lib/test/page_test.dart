import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/widget/cover/repo_page.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RepositoryManager(),
    );
  }
}
