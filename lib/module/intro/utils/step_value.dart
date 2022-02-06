import 'dart:math';

///IntroAnimationSteps
class Steps {
  static const List<double> values = [
    0.0,
    0.2,
    0.36, //0.2;2
    0.52, //0.4;3
    0.68, //0.6;4
    0.84, //0.8;5
    1.0,
  ];

  static int ceilingStep(double value) {
    int i = 0;
    while (values[i] < value) {
      ++i;
    }
    assert(i < values.length);
    return i;
  }

  static int floorStep(double value) {
    int i = values.length - 1;
    while (values[i] > value) {
      --i;
    }
    assert(i >= 0);
    return i;
  }

  ///快进到下一个目标值
  static double nextTargetValue(double value) {
    int idx = min(ceilingStep(value) + 1, values.length - 1);
    return values[idx];
  }

  ///回退到上一个目标值
  static double lastTargetValue(double value) {
    int idx = max(ceilingStep(value) - 1, 0);
    return values[idx];
  }

  static bool btwSteps(double value, int stp1, int stp2) {
    return value >= values[stp1] && value <= values[stp2];
  }

  static double midValueByStep(int stp1, int stp2) {
    return (values[stp1] + values[stp2]) / 2;
  }

  static bool btwMidSteps(double value, int stp1, int stp2) {
    return value >= midValueByStep(stp1 - 1, stp1) &&
        value <= midValueByStep(stp2 - 1, stp2);
  }

  ///计算当前值在两个阶段之间的进度，[0,1]
  static double ratioBtwSteps(double value) {
    int baseIdx = Steps.floorStep(value);
    double baseVal = Steps.values[baseIdx];
    double length = Steps.values[baseIdx + 1] - baseVal;
    return (value - baseVal) / length;
  }
}
