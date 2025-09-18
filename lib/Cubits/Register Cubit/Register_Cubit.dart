import 'package:chatapp/Cubits/Register%20Cubit/Register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  // ignore: non_constant_identifier_names
  Future<void> RegisterUser({required email, required password}) async {
    emit(RegisterLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(RegisterSucces());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        emit(RegisterFailed(erroremessage: "Weak Password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailed(erroremessage: "email is already exist"));
      }
    } catch (e) {
      emit(RegisterFailed(erroremessage: "There is an error"));
    }
  }
}
