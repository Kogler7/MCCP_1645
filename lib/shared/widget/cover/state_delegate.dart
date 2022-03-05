import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/widget/cover/layout_delegate.dart';

import 'data_typedef.dart';

class StateDelegate {
  List<dynamic> stateList = [];
  final LayoutDelegate layoutDelegate;
  final double coverWidth;
  final double infoPadding;

  StateDelegate({
    required this.layoutDelegate,
    this.coverWidth = 110,
    this.infoPadding = 120,
  });

  int get length => stateList.length;

  dynamic at(int idx) => stateList[idx];

  void parse(List<ProjInfo> infoList) {
    Size coverSize = Size.square(coverWidth);
    //初始编组
    for (var info in infoList) {
      if (info.tag == "") {
        stateList.add(ProjCoverState(info: info, size: coverSize));
      } else if (stateList.last is! List<ProjCoverState>) {
        stateList.add(<ProjCoverState>[
          ProjCoverState(info: info, size: coverSize, grouped: true)
        ]);
      } else {
        assert(stateList.last is List<ProjCoverState>);
        (stateList.last as List<ProjCoverState>)
            .add(ProjCoverState(info: info, size: coverSize, grouped: true));
      }
    }
    arrangeBase();
  }

  //编号，同时完成布局
  void arrangeBase() {
    for (int i = 0; i < stateList.length; i++) {
      if (stateList[i] is! List<ProjCoverState>) {
        (stateList[i] as ProjCoverState)
          ..layoutIdx = i
          ..offset = layoutDelegate.at(i);
      } else {
        var list = stateList[i] as List<ProjCoverState>;
        list[0]
          ..layoutIdx = i
          ..offset = layoutDelegate.at(i);
        for (int j = 1; j < list.length; j++) {
          list[j]
            ..layoutIdx = j - 1
            ..offset = layoutDelegate.at(j - 1);
        }
      }
    }
  }

  void arrangeAt(int idx){
    
  }

  void save(List<ProjInfo> infoList) {
    return;
  }

  void fold() {}

  bool unfold(int idx) {
    var list = stateList[idx];
    if (list is List<ProjCoverState>) {

      return true;
    }
    return false;
  }

  void remove(int idx) {
    stateList.removeAt(idx);
    arrangeBase();
  }

  void add() {}

  void merge() {}

  void printStates() {
    // ignore: avoid_print
    print("Printing CoverStates...");
    for (var e in stateList) {
      // ignore: avoid_print
      print(e);
    }
  }
}
