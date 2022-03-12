import 'dart:math';

import 'data_delegate.dart';

class ProjState {
  ProjInfo projInfo;
  List<int> imgList;

  ProjState({
    required this.projInfo,
    this.imgList = const [],
  });

  @override
  String toString() => "ProjState<${projInfo.toString()}>";
}

class StateDelegate {
  int currentIndex = -1;

  List<ProjInfo> infoList = [];
  List<dynamic> stateList = [];
  List<ProjState> subStateList = [];

  StateDelegate();

  int get stateCnt => stateList.length;

  int get subStateCnt => subStateList.length;

  bool get onBaseLayer => currentIndex == -1;

  ProjState stateAt(int idx) {
    assert(idx > -1 && idx < stateCnt, "stateAt index($idx) 超出范围");
    var state = stateList[idx];
    return state is ProjState ? state : (state as List<ProjState>).first;
  }

  ProjState subStateAt(int idx) => subStateList[idx];

  ProjInfo infoAt(int idx) => infoList[idx];

  void read(List<ProjInfo> src) {
    //初始编组
    stateList.clear();
    for (var info in src) {
      if (info.tag == "") {
        stateList.add(ProjState(projInfo: info));
      } else if (stateList.last is! List<ProjState>) {
        stateList.add(<ProjState>[ProjState(projInfo: info)]);
      } else {
        var subList = stateList.last as List<ProjState>;
        if (subList.first.projInfo.tag == info.tag) {
          subList.add(ProjState(projInfo: info));
        } else {
          stateList.add(<ProjState>[ProjState(projInfo: info)]);
        }
      }
    }
    setImages(stateList);
    geneInfo();
  }

  void setImages(List targetList) {
    for (var state in targetList) {
      if (state is ProjState) {
        state.imgList = <int>[state.projInfo.imgIdx];
      } else {
        var list = state as List<ProjState>;
        list.first.imgList = List.generate(
            min(3, list.length), (index) => list[index].projInfo.imgIdx);
        list.first.projInfo.info = "${list.length - 1} 首作品";
      }
    }
  }

  void geneInfo() {
    infoList.clear();
    if (currentIndex == -1) {
      for (var e in stateList) {
        if (e is ProjState) {
          infoList.add(e.projInfo);
        } else {
          infoList.add((e as List<ProjState>).first.projInfo);
        }
      }
    } else {
      for (var e in subStateList) {
        infoList.add(e.projInfo);
      }
    }
  }

  List<ProjInfo> save() {
    infoList.clear();

    for (var state in stateList) {
      if (state is List<ProjState>) {
        infoList.addAll(
          List.generate(state.length, (index) => state[index].projInfo),
        );
      } else {
        infoList.add((state as ProjState).projInfo);
      }
    }

    return infoList;
  }

  void fold() {
    currentIndex = -1;
    geneInfo();
  }

  bool unfold(int idx) {
    var list = stateList[idx];
    if (list is! List<ProjState>) return false;

    subStateList.clear();
    subStateList.addAll(list);
    subStateList.removeAt(0);

    currentIndex = idx;
    setImages(subStateList);
    geneInfo();
    return true;
  }

  void remove(int idx) {
    stateList.removeAt(idx);
    geneInfo();
  }

  void append(ProjInfo info) {
    var state = ProjState(projInfo: info, imgList: [info.imgIdx]);
    if (currentIndex == -1) {
      stateList.add(state);
    } else {
      (stateList[currentIndex] as List<ProjState>).add(state);
    }
    geneInfo();
  }

  void merge(int tgtIdx, int dstIdx) {
    var target = stateList[tgtIdx];
    var destin = stateList[dstIdx];

    var tag = infoAt(dstIdx).tag;

    if (destin is List<ProjState>) {
      if (target is List<ProjState>) {
        target.removeAt(0); //删除封面信息
        destin.addAll(target);
      } else {
        destin.add(target);
      }
    } else {
      var state = destin as ProjState;
      var tmp = <ProjState>[
        ProjState(
          //创建新封面
          projInfo: ProjInfo(
            tag: DateTime.now().toString(), //暂时这样，之后再补充
            name: "新建组",
            imgIdx: state.imgList.first,
          ),
        ),
      ];
      tmp.add(state);
      target is List<ProjState> ? tmp.addAll(target) : tmp.add(target);
      stateList.removeAt(dstIdx);
      stateList.insert(dstIdx, tmp);
    }

    //简单粗暴的方式统一更新tag
    for (var state in (stateList[dstIdx] as List<ProjState>)) {
      state.projInfo.tag = tag;
    }

    stateList.removeAt(tgtIdx);
    setImages(stateList);
    geneInfo();
  }

  void printStates() {
    // ignore: avoid_print
    print("Printing CoverStates...");
    for (var e in stateList) {
      // ignore: avoid_print
      print(e);
    }
  }
}
