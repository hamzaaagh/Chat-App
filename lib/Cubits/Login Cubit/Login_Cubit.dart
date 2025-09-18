import 'package:chatapp/Cubits/Login%20Cubit/Login_state.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSucces());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailed(errormessage: "Wrong email"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailed(errormessage: "Wrong password"));
      }
    } on Exception {
      emit(LoginFailed(errormessage: "something wrong"));
    }
  }
}
