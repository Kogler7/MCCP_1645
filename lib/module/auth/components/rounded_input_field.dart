//@dart=2.9
import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:mccp_1645/config/export.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: KColor.darkButton,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: KColor.darkButton,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
