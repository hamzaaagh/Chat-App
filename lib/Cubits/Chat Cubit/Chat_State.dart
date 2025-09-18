import 'package:chatapp/Models/MessgaeClass.dart';

abstract class ChatState {}

class ChatSucces extends ChatState {
  List<Message> messages;
  ChatSucces({required this.messages});
}

class ChatInitial extends ChatState {}
