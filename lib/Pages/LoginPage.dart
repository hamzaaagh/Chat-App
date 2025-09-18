import 'package:chatapp/Cubits/Chat%20Cubit/Chat_Cubit.dart';
import 'package:chatapp/Cubits/Login%20Cubit/Login_Cubit.dart';
import 'package:chatapp/Cubits/Login%20Cubit/Login_state.dart';
import 'package:chatapp/Pages/ChatPage.dart';
import 'package:chatapp/Pages/RegisterPage.dart';
import 'package:chatapp/Widgets/ButtonClick.dart';
import 'package:chatapp/helpers/Consts.dart';
import 'package:chatapp/Widgets/TextWidget.dart';
import 'package:chatapp/helpers/show_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = "LoginPage";

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginLoading) {
        isloading = true;
      } else if (state is LoginSucces) {
        BlocProvider.of<ChatCubit>(context).getmessage();
        Navigator.pushNamed(context, ChatPage.id, arguments: email);
        isloading = false;
      } else if (state is LoginFailed) {
        Showsnackbar(context, state.errormessage);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kPrimarycolor,
          body: Form(
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
                            "LOGIN",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormwidget(text: "Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormwidget(
                        text: "Password",
                        obscure: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          () async {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).LoginUser(
                                  email: email!, password: password!);
                            }
                          };
                        },
                        child: Buttonclick(text: "LOGIN"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Don\`t have an account ?",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              "  Register",
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
