import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/shared/widget/cover/animated_cover.dart';
import 'package:mccp_1645/shared/widget/cover/animated_text.dart';
import 'package:mccp_1645/shared/widget/cover/data_typedef.dart';
import 'package:mccp_1645/shared/widget/cover/state_delegate.dart';
import 'package:mccp_1645/shared/widget/cover/static.dart';

import 'layout_delegate.dart';

class RepositoryManager extends StatefulWidget {
  const RepositoryManager({Key? key}) : super(key: key);

  @override
  _RepositoryManagerState createState() => _RepositoryManagerState();
}

class _RepositoryManagerState extends State<RepositoryManager> {
  final _projInfoList = projInfoList;

  //item基本参数
  final double _coverDimension = 120;
  final double _infoPadding = 130;
  final double _itemHeight = 170;

  //延迟初始化的代理
  late Size _itemSize;
  late LayoutDelegate _layoutDelegate;
  late StateDelegate _stateDelegate;

  //Stream
  late StreamController<int> _updateCaller;

  //Duration
  final Duration _shiftingDuration = const Duration(milliseconds: 500);
  final Duration _transformDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    _updateCaller = StreamController.broadcast();
    _itemSize = Size(_coverDimension, _itemHeight);
    super.initState();
  }

  @override
  void dispose() {
    _updateCaller.close();
    super.dispose();
  }

  void update() => _updateCaller.add(0);

  @override
  Widget build(BuildContext context) {
    Size _ctxSize = context.mediaQuerySize;

    _layoutDelegate = LayoutDelegate(
      ctxSize: _ctxSize,
      itemSize: _itemSize,
      vertiPadding: 100,
      horizPadding: 20,
      vertiSpacing: 20,
      horizSpacing: 15,
    );
    _stateDelegate = StateDelegate(
      layoutDelegate: _layoutDelegate,
      coverWidth: _coverDimension,
      infoPadding: 120,
    );

    _stateDelegate.parse(_projInfoList);

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<int>(
            stream: _updateCaller.stream,
            builder: (ctx, snap) {
              var maxHeight = max(
                  _layoutDelegate.at(_stateDelegate.count - 1).dy +
                      _layoutDelegate.closeLayoutSize.height +
                      20,
                  _ctxSize.height);
              return AnimatedContainer(
                duration: _shiftingDuration,
                height: maxHeight,
                child: Stack(
                  children: <Widget>[
                    buildBaseStack(),
                    buildInfoStack(),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _stateDelegate.remove(0);
          //_stateDelegate.printStates();
          update();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBaseStack() {
    return StreamBuilder<int>(
      stream: _updateCaller.stream,
      builder: (context, snapshot) {
        return Stack(
          fit: StackFit.expand,
          children: List<Widget>.generate(
            _stateDelegate.count,
            (idx) {
              var res = _stateDelegate.stateAt(idx);
              if (res is ProjCoverState) {
                return AnimatedProjectCover(
                  key: ValueKey(res.info.id),
                  visible: res.visible,
                  dimension: _coverDimension,
                  offset: res.offset,
                  imgIdxList: [res.info.imgIdx],
                  shiftingDuration: _shiftingDuration,
                  transformDuration: _transformDuration,
                );
              } else if (res is List<ProjCoverState>) {
                var state = res[0];
                return AnimatedProjectCover(
                  key: ValueKey(state.info.id),
                  visible: state.visible,
                  dimension: _coverDimension,
                  offset: state.offset,
                  imgIdxList: List.generate(
                    res.length >= 3 ? 3 : res.length,
                    (idx) => res[idx].info.imgIdx,
                  ),
                  shiftingDuration: _shiftingDuration,
                  transformDuration: _transformDuration,
                );
              } else {
                return const Placeholder();
              }
            },
          ),
        );
      },
    );
  }

  Widget buildShadeLayer() => Container();

  Widget buildUnfoldStack() {
    return Stack();
  }

  Widget buildInfoStack() {
    return StreamBuilder<int>(
      stream: _updateCaller.stream,
      builder: (ctx, snap) {
        return Stack(
          children: List.generate(
            _stateDelegate.count,
            (index) {
              var info = _stateDelegate.infoAt(index);
              var pos = _layoutDelegate.at(index);
              return Positioned(
                left: pos.dx,
                top: pos.dy + _infoPadding,
                child: SizedBox(
                  width: _coverDimension,
                  height: _itemHeight - _infoPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedText(
                        duration: _shiftingDuration,
                        text: Text(
                          info.name,
                          key: ValueKey(info.id),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: AnimatedText(
                          duration: _shiftingDuration,
                          text: Text(
                            info.info,
                            key: ValueKey(info.id),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Positioned buildDragger() => Positioned(child: Container());
}
