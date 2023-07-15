abstract class LoginStates {}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
class RegisterInitialState extends LoginStates{}
class RegisterLoadingState extends LoginStates{}
class RegisterSuccessState extends LoginStates{}
class RegisterErrorState extends LoginStates{
  final String error;
  RegisterErrorState(this.error);
}

class SocialCreateUserLoadingState extends LoginStates{}
class SocialCreateUserSuccessState extends LoginStates{}
class SocialCreateUserErrorState extends LoginStates{
  final String error;
  SocialCreateUserErrorState(this.error);
}



