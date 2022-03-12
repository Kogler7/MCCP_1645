import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/util/vector.dart';

class LayoutDelegate {
  List<Offset> cacheList = [];
  List<Offset> offTargetList = [];
  int offTargetNum = 0;

  final int initItemCount; //预备计算的个数
  final double itemHeight;
  final double coverLength;
  final double infoPadding;

  final double vertiPadding; //四周竖直排布间距
  final double horizPadding; //四周水平排布间距
  final double vertiSpacing; //竖直方向排列间距
  final double horizSpacing; //水平方向排列间距（最小值）

  late double infoHeight;
  late Size contextSize;
  late Size closeLayoutSize; //紧密排布参考盒子
  late int vertiMaxCnt; //水平方向最大排布数量
  late Offset baseCoverOffset; //相对参考盒子计算的封面基础偏移量
  late Offset baseInfoOffset; //相对参考盒子计算的简介基础偏移量

  LayoutDelegate({
    this.initItemCount = 30,
    this.itemHeight = 170,
    this.coverLength = 120,
    this.infoPadding = 130,
    this.vertiPadding = 30,
    this.horizPadding = 20,
    this.vertiSpacing = 30,
    this.horizSpacing = 20,
  });

  void init(Size ctxSize) {
    contextSize = ctxSize;
    infoHeight = itemHeight - infoPadding;
    assert(contextSize.width >= coverLength + horizSpacing * 2);

    Size layoutZoneSize; //排布空间
    Offset paddingOffset; //排布空间偏移量
    Offset coverOffset; //待排item相对参考盒子偏移量
    Offset infoOffset; //待排info相对参考盒子偏移量

    paddingOffset = Offset(horizPadding, vertiPadding);
    layoutZoneSize = ctxSize - paddingOffset * 2 as Size;

    vertiMaxCnt = (layoutZoneSize.width / (coverLength + horizSpacing)).floor();
    closeLayoutSize =
        Size(layoutZoneSize.width / vertiMaxCnt, itemHeight + vertiSpacing);

    //计算相对参考盒子偏移量
    coverOffset = Offset((closeLayoutSize.width - coverLength) / 2, 0);
    infoOffset = Offset(coverOffset.dx, infoPadding);

    //最后得到基础相对额外偏移量
    baseCoverOffset = paddingOffset + coverOffset;
    baseInfoOffset = paddingOffset + infoOffset;

    //初始化快速访问数组
    cacheList.clear();
    cacheUpdateTo(initItemCount);
  }

  void initOffTargets(int targetNum, int centerIdx) {
    offTargetList.clear();
    offTargetNum = targetNum;

    Vector centerVector = Vector.of(coverAt(centerIdx));
    Vector targetVector = Vector.zero;
    Vector radiusVector = Vector.zero;

    var centerX = (contextSize.width - closeLayoutSize.width) / 2;
    var centerY = (contextSize.height - closeLayoutSize.height) / 2;

    targetVector.x =
        centerVector.x < centerX ? contextSize.width : -closeLayoutSize.width;
    targetVector.y =
        centerVector.y < centerY ? contextSize.height : -closeLayoutSize.height;

    radiusVector = targetVector - centerVector;
    var radius = radiusVector.distance;

    for (int i = 0; i < targetNum; i++) {
      if (i == centerIdx) {
        offTargetList.add(coverAt(i));
        continue;
      }
      Vector itemVector = Vector.of(coverAt(i));
      Vector dstVector =
          (itemVector - centerVector).normalVector * radius + centerVector;
      offTargetList.add(dstVector.offset);
    }
  }

  void cacheUpdateTo(int tgt) {
    for (int i = cacheList.length; i <= tgt; i++) {
      cacheList.add(Offset(
        closeLayoutSize.width * (i % vertiMaxCnt),
        closeLayoutSize.height * (i / vertiMaxCnt).floor(),
      ));
    }
  }

  Offset coverAt(int index) {
    cacheUpdateTo(index);
    Offset extraOffset = cacheList[index];
    return baseCoverOffset + extraOffset;
  }

  Offset infoAt(int index) {
    cacheUpdateTo(index);
    Offset extraOffset = cacheList[index];
    return baseInfoOffset + extraOffset;
  }

  Offset offAt(int index) {
    if (index >= offTargetNum) return Offset.zero;
    return offTargetList[index];
  }

  Offset get hiddenOffset =>
      -Offset(closeLayoutSize.width, closeLayoutSize.height);

  double layoutHeight(int count) =>
      coverAt(max(count - 1, 0)).dy + closeLayoutSize.height + vertiPadding;

  int findClosestTarget(Offset offset) {
    //确定item中心点坐标
    var itemCenter = offset.translate(coverLength / 2, coverLength / 2);
    //计算落在的目标index
    int targetIdx =
        (itemCenter.dy / closeLayoutSize.height).floor() * vertiMaxCnt +
            (itemCenter.dx / closeLayoutSize.width).floor();
    //计算相对距离
    var distance = (offset - coverAt(targetIdx)).distance;
    //判断距离是否足够近，并返回结果
    return distance <= 80 ? targetIdx : -1;
  }
}
