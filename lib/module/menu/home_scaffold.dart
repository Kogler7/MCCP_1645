import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/config/icon.dart';
import 'package:mccp_1645/module/menu/side_menu.dart';

class HomeScaffold extends StatefulWidget {
  final Color? backgroundColor;
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const HomeScaffold({
    Key? key,
    this.backgroundColor,
    this.appBarTitle,
    this.body,
    this.bottomNavigationBar,
    this.actions,
  }) : super(key: key);

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold>
    with TickerProviderStateMixin {
  double left = 0;
  late double direction;
  late double maxLeft;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          maxLeft = MediaQuery.of(context).size.width - 80;
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onHorizontalDragUpdate: (update) {
        left = left + update.delta.dx;
        direction = update.delta.direction;
        if (left <= 0) {
          left = 0;
        }

        if (left > maxLeft) {
          left = maxLeft;
        }
        setState(() {});
      },
      onHorizontalDragEnd: (end) {
        animateForward();
      },
      child: Container(
        color: const Color(0xff191f39),
        child: Stack(
          children: <Widget>[
            SideMenu(close: open),
            Positioned(
              left: left,
              top: left * 0.2,
              bottom: left * 0.2 / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(left * 0.2),
                  bottomLeft: Radius.circular(left * 0.2),
                ),
                child: buildScaffold(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScaffold() {
    return SizedBox(
      width: context.width,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: widget.backgroundColor,
          title: widget.appBarTitle,
          leading: IconButton(
            onPressed: open,
            icon: const Icon(
              KTabIcon.menu,
              color: Colors.grey,
            ),
          ),
          actions: widget.actions,
        ),
        body: widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }

  void open() {
    if (left == maxLeft) {
      direction = 1;
    } else {
      direction = 0;
    }

    animateForward();
  }

  late Animation _animation;

  void animateForward() {
    bool increment = direction <= 0;

    AnimationController _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        left = _animation.value;
        setState(() {});
      });

    double tempLeft = left;
    _animation = Tween(
      begin: tempLeft,
      end: increment ? maxLeft : 0.0,
    ).animate(CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn, parent: _controller));

    _controller.forward();
  }
}
