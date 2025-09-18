import 'package:chatapp/Cubits/Chat%20Cubit/Chat_Cubit.dart';
import 'package:chatapp/Cubits/Login%20Cubit/Login_Cubit.dart';
import 'package:chatapp/Cubits/Register%20Cubit/Register_Cubit.dart';
import 'package:chatapp/Pages/ChatPage.dart';
import 'package:chatapp/Pages/LoginPage.dart';
import 'package:chatapp/Pages/RegisterPage.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        routes: {
          // "/": (context) => LoginPage(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
