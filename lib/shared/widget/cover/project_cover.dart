import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';

class ProjectCover extends StatelessWidget {
  final double radius = 5;
  final double dimension;
  final int imgIdx;

  const ProjectCover({
    Key? key,
    this.dimension = 110,
    this.imgIdx = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: SizedBox(
        width: dimension,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image(
            image: KProjCover.byIdx(imgIdx),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
