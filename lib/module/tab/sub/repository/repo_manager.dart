import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/module/tab/sub/repository/delegate/async_delegate.dart';
import 'package:mccp_1645/module/tab/sub/repository/delegate/sign_delegate.dart';
import 'package:mccp_1645/module/tab/sub/repository/widget/animated_info.dart';
import 'package:mccp_1645/module/tab/sub/repository/widget/project_cover.dart';
import 'package:mccp_1645/shared/util/custom_curve.dart';

import 'delegate/data_delegate.dart';
import 'delegate/layout_delegate.dart';
import 'delegate/state_delegate.dart';
import 'widget/animated_cover.dart';

class RepositoryManager extends StatefulWidget {
  const RepositoryManager({Key? key}) : super(key: key);

  @override
  _RepositoryManagerState createState() => _RepositoryManagerState();
}

class _RepositoryManagerState extends State<RepositoryManager> {
  //Duration
  final Duration _shiftingDuration = const Duration(milliseconds: 800);
  final Duration _scaleDuration = const Duration(milliseconds: 400);
  final Duration _opacityDuration = const Duration(milliseconds: 200);

  //初始化代理
  final AsyncDelegate _asyncDel = AsyncDelegate();
  final SignDelegate _signDel = SignDelegate();
  final DataDelegate _dataDel = DataDelegate();
  final StateDelegate _stateDel = StateDelegate();
  final LayoutDelegate _layoutDel = LayoutDelegate(
    itemHeight: 170,
    coverLength: 120,
    infoPadding: 130,
    vertiPadding: 50,
    horizPadding: 20,
    vertiSpacing: 20,
    horizSpacing: 15,
  );

  @override
  void dispose() {
    _asyncDel.dispose();
    super.dispose();
  }

  void append() {}

  void removeAt(int index) {
    _stateDel.remove(index);
    //_stateDelegate.printStates();
    _asyncDel.update();
  }

  void unfoldAt(int index) {
    if (_stateDel.unfold(index)) {
      _layoutDel.initOffTargets(_stateDel.stateCnt, index);
    }
    _asyncDel.update();
  }

  void fold() {
    _stateDel.fold();
    _asyncDel.update();
  }

  @override
  Widget build(BuildContext context) {
    //初始化代理，必须在build时完成，最好不要反复刷新
    _layoutDel.init(context.mediaQuerySize);
    _stateDel.read(_dataDel.staticInfoList);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          fold();
        },
        child: StreamBuilder(
          stream: _asyncDel.baseStream,
          builder: (context, snapshot) {
            var maxHeight = max(
              _layoutDel.layoutHeight(
                _stateDel.onBaseLayer
                    ? _stateDel.stateCnt
                    : _stateDel.subStateCnt,
              ),
              _layoutDel.contextSize.height,
            );
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AnimatedContainer(
                duration: _shiftingDuration,
                height: maxHeight,
                child: Stack(
                  children: <Widget>[
                    buildBaseRepoLayer(),
                    buildUnfoldedLayer(),
                    buildInfoLayer(),
                    buildDragTargetLayer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeAt(0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBaseRepoLayer() {
    return AnimatedOpacity(
      opacity: _stateDel.onBaseLayer ? 1.0 : 0.0,
      duration: _opacityDuration,
      child: Stack(
        fit: StackFit.expand,
        children: List<Widget>.generate(
          _stateDel.stateCnt,
          (index) {
            var state = _stateDel.stateAt(index);
            var offset = _stateDel.onBaseLayer
                ? _layoutDel.coverAt(index)
                : _layoutDel.offAt(index);
            return AnimatedPositioned(
              key: ValueKey(state.projInfo.id),
              curve: CustomCurves.elasticOut[1.25],
              duration: _shiftingDuration,
              left: offset.dx,
              top: offset.dy,
              child: GestureDetector(
                child: AnimatedScale(
                  duration: _scaleDuration,
                  curve: CustomCurves.shrinkExpand,
                  scale: _signDel.isChosenByIdx(index) ? 1.1 : 1.0,
                  child: AnimatedProjectCover(
                    dimension: _layoutDel.coverLength,
                    scale: _stateDel.onBaseLayer ? 1.0 : 0,
                    imgIdxList: state.imgList,
                    duration: _scaleDuration,
                  ),
                  onEnd: () {},
                ),
                onTap: () {
                  unfoldAt(index);
                },
                onLongPressStart: (e) {
                  _signDel.dragStart();
                  _signDel.chosenIndex = index;
                  _asyncDel.initDragInfo(
                      _layoutDel.coverAt(index), e.localPosition);
                  _asyncDel.dragAniTo(_layoutDel.coverAt(index));
                  _asyncDel.update();
                },
                onLongPressUp: () {
                  _signDel.dragEnd();
                  if (_signDel.readyToMerge) {
                    _stateDel.merge(_signDel.chosenIndex, _signDel.targetIndex);

                    _asyncDel
                        .dragAniTo(_layoutDel.coverAt(_signDel.targetIndex));
                  } else {
                    _asyncDel.dragAniTo(_layoutDel.coverAt(index));
                  }
                  _signDel.chosenIndex = -1;
                  _asyncDel.update();
                },
                onLongPressMoveUpdate: (e) {
                  _signDel.dragUpdate();
                  _asyncDel.emitDragInfo(e.localPosition);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildUnfoldedLayer() {
    return IgnorePointer(
      ignoring: _stateDel.onBaseLayer, //透明度为0时依然会接受点击事件，故应屏蔽
      child: AnimatedOpacity(
        opacity: _stateDel.onBaseLayer ? 0.0 : 1.0,
        duration: _opacityDuration,
        child: FutureBuilder(
          future: _asyncDel.getSubLocState(_stateDel.currentIndex),
          initialData: SubLocState.folded,
          builder: (context, snapshot) {
            var locState = snapshot.data as SubLocState;
            return Stack(
              fit: StackFit.expand,
              children: List<Widget>.generate(
                _stateDel.subStateCnt,
                (index) {
                  var state = _stateDel.subStateAt(index);
                  var offset = locState == SubLocState.spread
                      ? _layoutDel.coverAt(index)
                      : _layoutDel.coverAt(
                          _asyncDel.getTgtIndex(_stateDel.currentIndex));
                  return AnimatedPositioned(
                    key: ValueKey(state.projInfo.id),
                    curve: CustomCurves.elasticOut[1.25],
                    duration: _shiftingDuration,
                    left: offset.dx,
                    top: offset.dy,
                    child: AnimatedProjectCover(
                      key: ValueKey(state.projInfo.id),
                      dimension: _layoutDel.coverLength,
                      imgIdxList: state.imgList,
                      duration: _scaleDuration,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildInfoLayer() {
    return Stack(
      children: List.generate(
        _stateDel.onBaseLayer ? _stateDel.stateCnt : _stateDel.subStateCnt,
        (index) {
          var pos = _layoutDel.infoAt(index);
          return Positioned(
            left: pos.dx,
            top: pos.dy,
            child: AnimatedInfo(
              info: _stateDel.infoAt(index),
              infoWidth: _layoutDel.coverLength,
              infoHeight: _layoutDel.infoHeight,
              duration: _shiftingDuration,
            ),
          );
        },
      ),
    );
  }

  Widget buildDragTargetLayer() {
    var offset = _layoutDel.coverAt(_signDel.safeChosenIndex);
    return IgnorePointer(
      ignoring: true,
      child: StreamBuilder<Offset>(
        stream: _asyncDel.dragStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox();

          var _trailOffset = snapshot.data as Offset;

          _signDel.targetIndex = _layoutDel.findClosestTarget(_trailOffset);

          var _targetOffset = _layoutDel.coverAt(_signDel.safeTargetIndex);

          var imgIdxList = _stateDel.stateAt(_signDel.lastChosenIndex).imgList;
          var len = min(imgIdxList.length, 3);

          return Visibility(
            visible: _signDel.shouldShowDrag,
            child: Stack(
              children: [
                Positioned(
                  //base
                  left: offset.dx,
                  top: offset.dy,
                  child: AnimatedScale(
                    duration: _scaleDuration,
                    curve: CustomCurves.shrinkExpand,
                    scale: _signDel.hasChosenItem ? 1.1 : 1.0,
                    child: Visibility(
                      visible: _signDel.hasChosenItem,
                      child: Container(
                        width: _layoutDel.coverLength,
                        height: _layoutDel.coverLength,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //target
                  left: _targetOffset.dx,
                  top: _targetOffset.dy,
                  child: AnimatedScale(
                    duration: _scaleDuration,
                    curve: CustomCurves.shrinkExpand,
                    scale: _signDel.hasChosenItem ? 1.1 : 1.0,
                    child: Visibility(
                      visible: _signDel.readyToMerge,
                      child: Container(
                        width: _layoutDel.coverLength,
                        height: _layoutDel.coverLength,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  //trail
                  children: List.generate(
                    len,
                    (index) {
                      var reversedIdx = len - index - 1;
                      return AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: _signDel.onDragStart
                            ? Duration.zero
                            : _signDel.onDragging
                                ? Duration(milliseconds: reversedIdx * 100)
                                : _signDel.onAnimating
                                    ? Duration(
                                        milliseconds: reversedIdx * 100 + 100)
                                    : Duration.zero,
                        left: _trailOffset.dx,
                        top: _trailOffset.dy,
                        onEnd: () {
                          _signDel.animationFinished();
                        },
                        child: FutureBuilder(
                          initialData: 1.0,
                          future: Future.value(1.1),
                          builder: (context, snapshot) {
                            var endVal = snapshot.data as double;
                            return AnimatedScale(
                              duration: _scaleDuration,
                              curve: CustomCurves.shrinkExpand,
                              scale: _signDel.hasChosenItem ? endVal : 1.0,
                              child: ProjectCover(
                                dimension: _layoutDel.coverLength,
                                imgIdx: imgIdxList[reversedIdx],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
