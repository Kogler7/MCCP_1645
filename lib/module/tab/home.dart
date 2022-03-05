import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';
import 'package:mccp_1645/config/icon.dart';
import 'package:mccp_1645/module/menu/home_scaffold.dart';
import 'package:mccp_1645/shared/control/animated_bar.dart';
import 'package:mccp_1645/test/widget_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bgColor = KColor.darkBackGround;
  int _currentIndex = 0;
  List<String> titles = ['推荐', '创作', '消息', '我的'];

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBarTitle: Text(
        titles[_currentIndex],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: buildBody(),
      bottomNavigationBar: buildAnimatedBottomBar(),
      backgroundColor: bgColor,
    );
  }

  Widget buildBody() {
    return const Center(
      child: TestWidget(),
    );
  }

  Widget buildAnimatedBottomBar() {
    return AnimatedBottomBar(
      backgroundColor: bgColor,
      selectedIndex: _currentIndex,
      containerHeight: 56,
      onItemSelected: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        AnimatedBarItem(
          icon: const Icon(KTabIcon.recommend),
          title: Text(titles[0]),
          activeColor: const Color(0xffF4D144),
        ),
        AnimatedBarItem(
          icon: const Icon(KTabIcon.myBase),
          title: Text(titles[1]),
          activeColor: Colors.greenAccent,
        ),
        AnimatedBarItem(
          icon: const Icon(KTabIcon.notice),
          title: Text(titles[2]),
          activeColor: Colors.pink,
        ),
        AnimatedBarItem(
          icon: const Icon(KTabIcon.me),
          title: Text(titles[3]),
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
