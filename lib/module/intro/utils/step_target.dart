///存储各动画目标
List<double> stepTargets = [
  0.0,
  0.2,
  0.36, //0.2;2
  0.52, //0.4;3
  0.68, //0.6;4
  0.84, //0.8;5
  1.0,
];

double getMidStepTarget(int idx1, int idx2) {
  return (stepTargets[idx1] + stepTargets[idx2]) / 2.0;
}

bool isBetweenSteps(double value, int idx1, int idx2) {
  return value >= stepTargets[idx1] && value <= stepTargets[idx2];
}

bool isBetweenMidSteps(double value, int idx1, int idx2) {
  return value >= getMidStepTarget(idx1 - 1, idx1) &&
      value <= getMidStepTarget(idx2 - 1, idx2);
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
