import '../static.dart';

class ProjInfo {
  late String? id;
  late String tag;
  final int imgIdx;
  final String name;
  String info;

  ProjInfo({
    this.id,
    this.tag = "",
    this.name = "作品名称",
    this.info = "作品信息",
    this.imgIdx = 0,
  }) {
    id = id ?? (tag + name + info).hashCode.toString(); //若id为空，则自动赋予一个唯一id
  }

  @override
  String toString() => "[$tag] $name : $info";
}

class DataDelegate {
  DataDelegate();

  List<ProjInfo> get staticInfoList => staticProjInfoList;
}
