import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_one/models/social_user_model.dart';
import 'package:firebase_project_one/modules/chats/chats_screen.dart';
import 'package:firebase_project_one/modules/feeds/feeds_screen.dart';
import 'package:firebase_project_one/modules/settings/settings_screen.dart';
import 'package:firebase_project_one/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../users/users_screen.dart';
import 'social_states.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit() : super(AppInitialState());
  static SocialCubit get(context)=>BlocProvider.of(context);
  // bool isDark=false;
  // void changeAppMode({bool? fromShared}){
  //   if(fromShared!=null){
  //     isDark=fromShared;
  //     emit(AppChangeModeState());
  //   }else{
  //     isDark=!isDark;
  //     emit(AppChangeModeState());
  //   }
  // }
  SocialUserModel? model;
void getUserData(){
  emit(SocialGetUserLoadingState());
   FirebaseFirestore.instance.collection('users').doc(uId).get().then((value){
    model=SocialUserModel.fromJson(value.data());
    // print(value.data());
    emit(SocialGetUserSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(SocialGetUserErrorState(error.toString()));
  });
}
int currentIndex=0;
List<Widget> screens=[
  FeedsScreen(),
  ChatsScreen(),
  UsersScreen(),
  SettingsScreen(),
];
List<String> titles=[
  'Home',
  'Chats',
  'Users',
  'Settings',
];
void changeBottomNavBar(int index) {
  currentIndex = index;

  emit(SocialChangeBottomNavState());
}
}