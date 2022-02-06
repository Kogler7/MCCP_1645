import 'package:mccp_1645/module/intro/utils/step_value.dart';

void methodTest() {
  for (double i = 0; i <= 1; i += 0.01) {
    print("i:${i.toStringAsFixed(2)}"
        ",f:${Steps.floorStep(i)}"
        ",c:${Steps.ceilingStep(i)}");
  }
}
