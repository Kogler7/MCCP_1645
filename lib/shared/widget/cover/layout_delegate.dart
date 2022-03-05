import 'package:flutter/material.dart';

class LayoutDelegate {
  final Size ctxSize;
  final Size itemSize;

  final double vertiPadding; //四周竖直排布间距
  final double horizPadding; //四周水平排布间距
  final double vertiSpacing; //竖直方向排列间距
  final double horizSpacing; //水平方向排列间距（最小值）

  late int vertiMaxCnt; //水平方向最大排布数量

  late Size layoutZoneSize; //排布空间
  late Offset paddingOffset; //排布空间偏移量

  late Size closeLayoutSize; //紧密排布参考盒子
  late Offset centerOffset; //待排item相对参考盒子偏移量

  late Offset baseOffset; //相对参考盒子计算的基础偏移量

  LayoutDelegate({
    required this.ctxSize,
    this.itemSize = const Size(100, 150),
    this.vertiPadding = 30,
    this.horizPadding = 20,
    this.vertiSpacing = 30,
    this.horizSpacing = 20,
  }) : assert(ctxSize.width >= itemSize.width + horizSpacing * 2) {
    paddingOffset = Offset(horizPadding, vertiPadding);
    layoutZoneSize = ctxSize - paddingOffset * 2 as Size;

    vertiMaxCnt =
        (layoutZoneSize.width / (itemSize.width + horizSpacing)).floor();
    closeLayoutSize = Size(
        layoutZoneSize.width / vertiMaxCnt, itemSize.height + vertiSpacing);

    //计算参考盒子中心偏移量，默认竖直方向上贴顶
    centerOffset = Offset((closeLayoutSize.width - itemSize.width) / 2, 0);

    //最后得到基础相对额外偏移量
    baseOffset = paddingOffset + centerOffset;
  }

  Offset at(int index) {
    Offset extraOffset = Offset(
      closeLayoutSize.width * (index % vertiMaxCnt),
      closeLayoutSize.height * (index / vertiMaxCnt).floor(),
    );
    return baseOffset + extraOffset;
  }

  Offset offAt(int index) {
    return baseOffset;
  }
}