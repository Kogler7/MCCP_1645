import 'package:flutter/material.dart';
import 'package:mccp_1645/shared/widget/cover/layout_delegate.dart';

import 'data_typedef.dart';

class StateDelegate {
  List<dynamic> stateList = [];
  List<ProjInfo> infoList = [];

  final LayoutDelegate layoutDelegate;
  final double coverWidth;
  final double infoPadding;

  StateDelegate({
    required this.layoutDelegate,
    this.coverWidth = 110,
    this.infoPadding = 120,
  });

  int get count => stateList.length;

  dynamic stateAt(int idx) => stateList[idx];

  ProjInfo infoAt(int idx) => infoList[idx];

  void parse(List<ProjInfo> src) {
    Size coverSize = Size.square(coverWidth);
    //初始编组
    for (var info in src) {
      if (info.tag == "") {
        stateList.add(ProjCoverState(info: info, size: coverSize));
      } else if (stateList.last is! List<ProjCoverState>) {
        stateList.add(<ProjCoverState>[
          ProjCoverState(info: info, size: coverSize, grouped: true)
        ]);
      } else {
        if ((stateList.last as List<ProjCoverState>).first.info.tag ==
            info.tag) {
          (stateList.last as List<ProjCoverState>)
              .add(ProjCoverState(info: info, size: coverSize, grouped: true));
        } else {
          stateList.add(<ProjCoverState>[
            ProjCoverState(info: info, size: coverSize, grouped: true)
          ]);
        }
      }
    }
    generateInfo();
    arrangeBase();
  }

  void generateInfo() {
    infoList = [];
    for (var e in stateList) {
      if (e is ProjCoverState) {
        infoList.add(e.info);
      } else {
        infoList.add((e as List<ProjCoverState>).first.info);
      }
    }
  }

  //布局
  void arrangeBase() {
    for (int i = 0; i < stateList.length; i++) {
      if (stateList[i] is! List<ProjCoverState>) {
        (stateList[i] as ProjCoverState).offset = layoutDelegate.at(i);
      } else {
        var list = stateList[i] as List<ProjCoverState>;
        list[0].offset = layoutDelegate.at(i);
        for (int j = 1; j < list.length; j++) {
          list[j].offset = layoutDelegate.at(j - 1);
        }
      }
    }
  }

  void arrangeAt(int idx) {}

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
    generateInfo();
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
