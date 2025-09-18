import 'package:chatapp/Cubits/Chat%20Cubit/Chat_Cubit.dart';
import 'package:chatapp/Cubits/Chat%20Cubit/Chat_State.dart';
import 'package:chatapp/Models/MessgaeClass.dart';
import 'package:chatapp/Widgets/ChatBublle.dart';
import 'package:chatapp/helpers/Consts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  static String id = "Chatpage";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

// ignore: non_constant_identifier_names

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String email = ModalRoute.of(context)!.settings.arguments as String;
    List<Message> MessageList = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarycolor,
        title: Row(
          children: [
            Image.asset(kLogo),
            Text(
              "Chat",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child:
                BlocConsumer<ChatCubit, ChatState>(listener: (context, state) {
              if (state is ChatSucces) {
                MessageList = state.messages;
                print(MessageList);
              }
            }, builder: (context, state) {
              return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(bottom: 15),
                  controller: scrollController,
                  itemCount: MessageList.length,
                  itemBuilder: (context, index) {
                    return MessageList[index].id == email
                        ? ChatBublle(
                            message: MessageList[index],
                          )
                        : ChatBubllewithfriend(
                            message: MessageList[index],
                          );
                  });
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                BlocProvider.of<ChatCubit>(context)
                    .sendmessage(message: data, email: email);

                scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              decoration: InputDecoration(
                  fillColor: kPrimarycolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: "Send Message",
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.send,
                      color: kPrimarycolor,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
