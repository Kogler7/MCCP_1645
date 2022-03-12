class SignDelegate {
  int _chosenIndex = -1;
  int _lastChosenIndex = 0;
  int _targetIndex = -1;
  int _lastTargetIndex = 0;

  bool _longPressed = false;
  bool _onDragMoving = false;
  bool _onAnimating = false;
  int _dragUpdCnt = 0;

  void dragStart() {
    _longPressed = true;
    _onAnimating = false;
    _dragUpdCnt = 0;
  }

  void dragUpdate() {
    _dragUpdCnt++;
    _onDragMoving = true;
    _onAnimating = false;
  }

  void dragEnd() {
    _longPressed = false;
    _onDragMoving = false;
    _onAnimating = true;
  }

  void animationFinished() => _onAnimating = false;

  bool get onDragStart => _longPressed && !onDragging && !_onAnimating;

  bool get onDragging => _onDragMoving && _dragUpdCnt > 5;

  bool get onAnimating => _onAnimating;

  bool get shouldShowDrag => _longPressed || _onAnimating;

  String get draggingState {
    if (onDragStart) return "Drag Start";
    if (onDragging) return "Dragging";
    if (onAnimating) {
      return "Animating";
    } else {
      return "Unknown Drag State";
    }
  }

  set targetIndex(int val) {
    _targetIndex = val;
    if (val != -1) _lastTargetIndex = val;
  }

  bool get readyToMerge => hasChosenItem && hasFoundedTarget;

  int get targetIndex => _targetIndex;

  int get safeTargetIndex => _targetIndex > -1 ? _targetIndex : 0;

  int get lastTargetIndex => _lastTargetIndex;

  bool get hasFoundedTarget =>
      _targetIndex != -1 && _targetIndex != _chosenIndex;

  set chosenIndex(int val) {
    _chosenIndex = val;
    if (val != -1) _lastChosenIndex = val;
  }

  int get chosenIndex => _chosenIndex;

  int get safeChosenIndex => _chosenIndex != -1 ? _chosenIndex : 0;

  int get lastChosenIndex => _lastChosenIndex;

  bool get hasChosenItem => _chosenIndex != -1;

  bool isChosenByIdx(int index) => _chosenIndex == index;
}
