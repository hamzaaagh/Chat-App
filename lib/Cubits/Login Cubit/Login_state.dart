abstract class LoginState {}

class LoginLoading extends LoginState {}

class LoginSucces extends LoginState {}

class LoginFailed extends LoginState {
  String errormessage;
  LoginFailed({required this.errormessage});
}

class LoginInitial extends LoginState {}
