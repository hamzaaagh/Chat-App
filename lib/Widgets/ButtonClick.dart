import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Buttonclick extends StatelessWidget {
  Buttonclick({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 40,
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 15),
      )),
    );
  }
}
