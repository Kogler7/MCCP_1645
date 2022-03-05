import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/widget/cover/project_cover.dart';

class AnimatedProjectCover extends StatelessWidget {
  final double radius = 5;
  final Offset offset;
  final double dimension;
  final bool visible;

  final Duration shiftingDuration;
  final Duration transformDuration;
  final List<int> imgIdxList;

  const AnimatedProjectCover({
    Key? key,
    this.offset = const Offset(0, 0),
    this.dimension = 110,
    this.visible=true,
    this.shiftingDuration = const Duration(milliseconds: 300),
    this.transformDuration = const Duration(milliseconds: 100),
    this.imgIdxList = const [0],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var len = imgIdxList.length;

    return Visibility(
      visible: visible,
      child: AnimatedPositioned(
        key: key,
        curve: Curves.easeInOut,
        duration: shiftingDuration,
        left: offset.dx,
        top: offset.dy,
        child: AnimatedSize(
          duration: transformDuration,
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
        ),
      ),
    );
  }
}
