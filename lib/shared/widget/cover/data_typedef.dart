import 'package:flutter/material.dart';

class ProjInfo {
  late String? id;
  final String tag;
  final String name;
  final String info;
  final int imgIdx;

  ProjInfo({
    this.id,
    this.tag = "",
    this.name = "作品名称",
    this.info = "作品信息",
    this.imgIdx = 0,
  }) {
    id = id ?? DateTime.now().toString(); //若id为空，则根据时间自动赋予一个唯一id
  }

  @override
  String toString() => "[$tag] $name : $info";
}

class ProjCoverState {
  Size size;
  bool grouped;
  bool visible;
  int layoutIdx;
  Offset offset;
  ProjInfo info;

  ProjCoverState({
    this.size = Size.zero,
    this.grouped = false,
    this.visible = true,
    this.layoutIdx = 0,
    this.offset = Offset.zero,
    required this.info,
  });

  @override
  String toString() => "CoverState<${info.toString()}>";
}

class ProjInfoState {
  String title;
  String subTitle;
  Offset offset;

  ProjInfoState({
    required this.title,
    required this.subTitle,
    required this.offset,
  });
}
