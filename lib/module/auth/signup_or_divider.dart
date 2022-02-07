//@dart=2.9

import 'package:flutter/material.dart';
import 'package:mccp_1645/config/export.dart';

// class OrDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
//       width: size.width * 0.8,
//       child: Row(
//         children: <Widget>[
//           buildDivider(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               "OR",
//               style: TextStyle(
//                 color: KColor.darkBackGround,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           buildDivider(),
//         ],
//       ),
//     );
//   }
//
//   Expanded buildDivider() {
//     return Expanded(
//       child: Divider(
//         color: KColor.darkBackGround,
//         height: 1.5,
//       ),
//     );
//   }
// }
class LineWidget extends StatelessWidget {
  const LineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Divider(color: KColor.darkBackGround),
    );
  }
}
