import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccp_1645/shared/widget/cover/animated_cover.dart';
import 'package:mccp_1645/shared/widget/cover/data_typedef.dart';
import 'package:mccp_1645/shared/widget/cover/state_delegate.dart';
import 'package:mccp_1645/shared/widget/cover/static.dart';

import 'layout_delegate.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({Key? key}) : super(key: key);

  @override
  _RepoPageState createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  final _projInfoList = projInfoList;

  final double _coverDimension = 110;
  late Size _itemSize;

  late LayoutDelegate _layoutDelegate;
  late StateDelegate _stateDelegate;

  final _baseStreamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _baseStreamController.close();
    super.dispose();
  }

  void setBaseStack() => _baseStreamController.add(0);

  @override
  Widget build(BuildContext context) {
    Size _ctxSize = context.mediaQuerySize;
    _itemSize = Size(_coverDimension, 150);

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
      body: buildBaseStack(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _stateDelegate.remove(0);
          _stateDelegate.printStates();
          setBaseStack();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBaseStack() {
    return StreamBuilder<int>(
      stream: _baseStreamController.stream,
      builder: (context, snapshot) {
        return Stack(
          fit: StackFit.expand,
          children: List<Widget>.generate(
            _stateDelegate.length,
            (idx) {
              var res = _stateDelegate.at(idx);
              if (res is ProjCoverState) {
                return AnimatedProjectCover(
                  key: ValueKey(res.info.id),
                  visible: res.visible,
                  dimension: _coverDimension,
                  offset: res.offset,
                  imgIdxList: [res.info.imgIdx],
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

  Widget buildUnfoldStack() => Stack();

  Stack buildInfoStack() => Stack();

  Positioned buildDragger() => Positioned(child: Container());
}
