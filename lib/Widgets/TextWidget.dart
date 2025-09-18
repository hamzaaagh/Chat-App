import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormwidget extends StatelessWidget {
  TextFormwidget({
    this.onchanged,
    required this.text,
    this.obscure = false,
  });
  bool obscure;
  String? text;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required";
        }
        return null;
      },
      onChanged: onchanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white),
          hintText: text,
          border: OutlineInputBorder()),
    );
  }
}
