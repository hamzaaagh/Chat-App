import 'package:chatapp/Models/MessgaeClass.dart';
import 'package:chatapp/helpers/Consts.dart';
import 'package:flutter/material.dart';

class ChatBublle extends StatelessWidget {
  final Message message;
  const ChatBublle({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 6, right: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: kPrimarycolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubllewithfriend extends StatelessWidget {
  final Message message;
  const ChatBubllewithfriend({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 6, right: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
