import 'package:flutter/material.dart';

class FlatTitledScope extends StatelessWidget {
  final double width;
  final Color backColor;
  final String title;
  final List<Widget> tiles;

  const FlatTitledScope({
    Key? key,
    this.width = 200, //不起作用
    this.title = "",
    required this.tiles,
    this.backColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backColor,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 26,
                    left: 20,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Container(
                    height: 1,
                    width: 70,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tiles,
            )
          ],
        ),
      ),
    );
  }
}
