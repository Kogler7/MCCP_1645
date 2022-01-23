import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final ImageProvider image;
  final double maxWidth;
  final double maxHeight;

  const ImageBox({
    Key? key,
    required this.image,
    this.maxWidth = 350,
    this.maxHeight = 350,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
      child: Image(
        image: image,
        fit: BoxFit.contain,
      ),
    );
  }
}
