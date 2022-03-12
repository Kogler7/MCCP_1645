import 'dart:async';

import 'package:flutter/cupertino.dart';

enum SubLocState {
  spread,
  folded,
}

class AsyncDelegate {
  int lastStateIndex = -1;
  Offset dragOffsetDiff = Offset.zero;

  final StreamController<bool> updateCaller = StreamController();
  final StreamController<Offset> dragTracker = StreamController();

  void dispose() {
    updateCaller.close();
    dragTracker.close();
  }

  Stream<bool> get baseStream => updateCaller.stream;

  Stream<Offset> get dragStream => dragTracker.stream;

  void update() => updateCaller.add(true);

  void initDragInfo(Offset cover, Offset drag) => dragOffsetDiff = cover - drag;

  void emitDragInfo(Offset offset) => dragTracker.add(offset + dragOffsetDiff);

  void dragAniTo(Offset offset) => dragTracker.add(offset);

  Future getSubLocState(int curIndex) => curIndex == -1
      ? Future.value(SubLocState.folded)
      : Future.value(SubLocState.spread);

  int getTgtIndex(int curIndex) {
    if (curIndex != -1) {
      lastStateIndex = curIndex;
      return curIndex;
    } else {
      return lastStateIndex;
    }
  }
}
