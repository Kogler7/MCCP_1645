///存储各动画目标
List<double> stepTargets = [
  0.0,
  0.1,
  0.28,//0.2;2
  0.46,//0.4;3
  0.64,//0.6;4
  0.82,//0.8;5
  1.0,
];

double getMidStepTarget(int idx1, int idx2) {
  return (stepTargets[idx1] + stepTargets[idx2]) / 2.0;
}

bool isBetweenSteps(double value, int idx1, int idx2) {
  return value >= stepTargets[idx1] && value <= stepTargets[idx2];
}

double getNextStepTgt(double nw) {
  int i = 0;
  while (stepTargets[i] < nw) {
    ++i;
  }
  return ++i < stepTargets.length ? stepTargets[i] : 1.0;
}

double getLastStepTgt(double nw) {
  int i = 6;
  while (stepTargets[i] > nw) {
    --i;
  }
  return --i >= 0 ? stepTargets[i] : 0;
}
