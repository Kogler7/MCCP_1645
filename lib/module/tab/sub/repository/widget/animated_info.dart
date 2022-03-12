import 'package:flutter/material.dart';
import 'package:mccp_1645/module/tab/sub/repository/delegate/data_delegate.dart';

import 'animated_text.dart';

class AnimatedInfo extends StatelessWidget {
  final ProjInfo info;
  final double infoWidth;
  final double infoHeight;
  final Duration duration;

  const AnimatedInfo({
    required this.info,
    required this.infoWidth,
    required this.infoHeight,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: infoWidth,
      height: infoHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedText(
            duration: duration,
            text: Text(
              info.name,
              key: ValueKey(info.id),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: AnimatedText(
              duration: duration,
              text: Text(
                info.info,
                key: ValueKey(info.id),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
