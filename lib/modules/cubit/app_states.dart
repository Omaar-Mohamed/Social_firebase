abstract class AppStates {}
class LoginInitialState extends AppStates{}
class LoginLoadingState extends AppStates{}
class LoginSuccessState extends AppStates{}
class LoginErrorState extends AppStates{
  final String error;
  LoginErrorState(this.error);
}
class RegisterInitialState extends AppStates{}
class RegisterLoadingState extends AppStates{}
class RegisterSuccessState extends AppStates{}
class RegisterErrorState extends AppStates{
  final String error;
  RegisterErrorState(this.error);
}

class SocialCreateUserLoadingState extends AppStates{}
class SocialCreateUserSuccessState extends AppStates{}
class SocialCreateUserErrorState extends AppStates{
  final String error;
  SocialCreateUserErrorState(this.error);
}

