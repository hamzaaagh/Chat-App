// ignore_for_file: unused_element

import 'package:chatapp/Cubits/Chat%20Cubit/Chat_State.dart';
import 'package:chatapp/Models/MessgaeClass.dart';
import 'package:chatapp/helpers/Consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  // List<Message> messageslist = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  void sendmessage({required String message, required String email}) {
    try {
      messages.add({
        kMessage: message,
        kCreatedTime: DateTime.now(),
        kID: email,
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void getmessage() {
    messages
        .orderBy(kCreatedTime, descending: true)
        .snapshots()
        .listen((event) {
      List<Message> messageslist = [];
      for (var doc in event.docs) {
        print("succes");

        messageslist.add(Message.fromJson(doc));
      }
      emit(ChatSucces(messages: messageslist));
    });
  }
}
