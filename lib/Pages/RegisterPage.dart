import 'package:chatapp/Cubits/Chat%20Cubit/Chat_Cubit.dart';
import 'package:chatapp/Cubits/Register%20Cubit/Register_Cubit.dart';
import 'package:chatapp/Cubits/Register%20Cubit/Register_state.dart';
import 'package:chatapp/Pages/ChatPage.dart';
import 'package:chatapp/Widgets/ButtonClick.dart';
import 'package:chatapp/helpers/Consts.dart';
import 'package:chatapp/Widgets/TextWidget.dart';
import 'package:chatapp/helpers/show_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = "RegisterPage";

  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterLoading) {
        isloading = true;
      } else if (state is RegisterSucces) {
        BlocProvider.of<ChatCubit>(context).getmessage();
        Navigator.pushNamed(context, ChatPage.id, arguments: email);
        isloading = false;
      } else if (state is RegisterFailed) {
        Showsnackbar(context, state.erroremessage);
        isloading = false;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kPrimarycolor,
          body: Form(
            key: formkey,
            child: ListView(children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/scholar.png"),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Scholar Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "Pacifico",
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormwidget(
                          onchanged: (data) {
                            email = data;
                          },
                          text: "Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormwidget(
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                          text: "Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .RegisterUser(
                                    email: email!, password: password!);
                          }
                        },
                        child: Buttonclick(text: "Register"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an account ?",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "  LOGIN",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
