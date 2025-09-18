abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSucces extends RegisterState {}

class RegisterFailed extends RegisterState {
  String erroremessage;
  RegisterFailed({required this.erroremessage});
}

class RegisterLoading extends RegisterState {}
