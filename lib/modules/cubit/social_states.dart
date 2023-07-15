abstract class SocialStates {}
class AppInitialState extends SocialStates{}
class SocialGetUserLoadingState extends SocialStates{}
class SocialGetUserSuccessState extends SocialStates{}
class SocialGetUserErrorState extends SocialStates{
  final String error;
  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates{}

class SocialNewPostState extends SocialStates{}

