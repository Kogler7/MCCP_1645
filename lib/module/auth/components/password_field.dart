import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:mccp_1645/config/export.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: KColor.darkButton,
        decoration: const InputDecoration(
          hintText: "密码",
          icon: Icon(
            Icons.lock,
            color: KColor.darkButton,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: KColor.darkButton,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
