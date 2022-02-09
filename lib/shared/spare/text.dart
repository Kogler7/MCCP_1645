import 'package:flutter/material.dart';

class StaticNoteBar extends StatelessWidget {
  final String text;

  const StaticNoteBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeaf2f8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xff266ed5),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}