import 'package:flutter/material.dart';

import 'project_cover.dart';

class AnimatedProjectCover extends StatelessWidget {
  final double radius = 5;

  final double scale;
  final double dimension;

  final Duration duration;
  final List<int> imgIdxList;

  const AnimatedProjectCover({
    Key? key,
    this.scale = 1.0,
    this.dimension = 110,
    this.duration = const Duration(milliseconds: 100),
    this.imgIdxList = const [0],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var len = imgIdxList.length;

    return AnimatedScale(
      duration: duration,
      curve: Curves.ease,
      scale: scale,
      child: Stack(
        children: [
          len >= 3
              ? Transform.rotate(
                  angle: 0.1,
                  child: ProjectCover(
                    imgIdx: imgIdxList[2],
                    dimension: dimension,
                  ),
                )
              : const SizedBox(),
          len >= 2
              ? Transform.rotate(
                  angle: -0.1,
                  child: ProjectCover(
                    imgIdx: imgIdxList[1],
                    dimension: dimension,
                  ),
                )
              : const SizedBox(),
          ProjectCover(
            imgIdx: imgIdxList[0],
            dimension: dimension,
          ),
        ],
      ),
    );
  }
}
