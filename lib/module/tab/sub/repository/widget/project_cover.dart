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
    return Container(
      height: dimension,
      width: dimension,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: KProjCover.byIdx(imgIdx),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
