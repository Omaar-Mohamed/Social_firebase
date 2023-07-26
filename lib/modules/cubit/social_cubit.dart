import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_one/models/message_model.dart';
import 'package:firebase_project_one/models/post_model.dart';
import 'package:firebase_project_one/models/social_user_model.dart';
import 'package:firebase_project_one/modules/chats/chats_screen.dart';
import 'package:firebase_project_one/modules/feeds/feeds_screen.dart';
import 'package:firebase_project_one/modules/new_post/new_post_screen.dart';
import 'package:firebase_project_one/modules/settings/settings_screen.dart';
import 'package:firebase_project_one/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../users/users_screen.dart';
import 'social_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  SocialUserModel? userModel;
void getUserData(){
  emit(SocialGetUserLoadingState());
   FirebaseFirestore.instance.collection('users').doc(uId).get().then((value){
    userModel=SocialUserModel.fromJson(value.data());
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
  NewPostScreen(),
  UsersScreen(),
  SettingsScreen(),
];
List<String> titles=[
  'Home',
  'Chats',
  'Post',
  'Users',
  'Settings',
];
void changeBottomNavBar(int index) {
  if (index == 0)
    getPosts();
  if (index == 1)
    getUsers();
   if (index == 2)
      emit(SocialNewPostState());
  else{
    currentIndex = index;
    emit(SocialChangeBottomNavState());

  }
}

  File? profileImage;
  var picker=ImagePicker();
  Future<void>   getProfileImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());

    }else{
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;
  Future<void> getCoverImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());

    }else{
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }

// String? profileImageUrl;
void uploadProfileImage({
  required String name,
  required String phone,
  required String bio,
}){
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio:bio,
          image: value,
        );
        // profileImageUrl=value;
        // updateUser(
        //   name: userModel!.name,
        //   phone: userModel!.phone,
        //   bio: userModel!.bio,
        //   image: value,
        //   cover: userModel!.cover,
        // );
        // emit(SocialUploadProfileImageSuccessState());
      }).catchError((error){
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error){
      emit(SocialUploadProfileImageErrorState());
    });
}

// String? coverImageUrl;
void uploadCoverImage({
  required String name,
  required String phone,
  required String bio,
}){
  emit(SocialUserUpdateLoadingState());
  firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        // coverImageUrl=value;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          // image: value,
          cover: value,
        );
        // emit(SocialUploadCoverImageSuccessState());
      }).catchError((error){
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error){
      emit(SocialUploadCoverImageErrorState());
    });
}
// void updateUserImages({
//   required String name,
//   required String phone,
//   required String bio,
//
// }) {
//   emit(SocialUserUpdateLoadingState());
//   if(coverImage!=null){
//   uploadCoverImage();
//   }else if(profileImage!=null){
//     uploadProfileImage();
//   }else if(coverImage!=null&&profileImage!=null){
//     uploadCoverImage();
//     uploadProfileImage();
//   }
//
//   else{
// updateUser(name: name, phone: phone, bio: bio);
//   }
//
//
// }

void updateUser({
  required String name,
  required String phone,
  required String bio,
  String? cover ,
  String? image,

}){

  SocialUserModel model = SocialUserModel(
    name: name,
    phone: phone,
    bio: bio,
    email: userModel!.email,
    image: image ?? userModel!.image,
    cover: cover ?? userModel!.cover,
    uId: userModel!.uId ,
    isEmailVerified: false,

  );
  FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update(
      model.toMap()).then((value) {
        emit(SocialUserUpdateSuccessState());
    getUserData();
  }).catchError((error) {
    print(error.toString());
    emit(SocialUserUpdateErrorState());
  });
}

  File? postImage;
  Future<void> getPostImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());

    }else{
      print('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }

  void removePostImage(){
    postImage=null;
    emit(SocialRemovePostImageState());
  }

  void uploadPostImage({

    required String dateTime,
    required String? text,
  }){
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        // coverImageUrl=value;
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
        // emit(SocialUploadCoverImageSuccessState());
      }).catchError((error){
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String? text,
    String? postImage,

  }){
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel!.name,
      image:  userModel!.image,
      uId: userModel!.uId ,
      dateTime: dateTime,
      text: text,
      postImage: postImage??'',

    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int?> likes = [];
  List<int?> commentsNumbers = [];
  List<String?> comments = [];
  void getPosts(){
posts=[];
postsId=[];
    emit(SocialGetPostsLoadingState());
      FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          posts.add(PostModel.fromJson(element.data()));
          postsId.add(element.id);
          print(element.id);
          print(value.docs.length);
          emit(SocialGetPostsSuccessState());
        });
        // element.reference.collection('comments').get().then((value) {
        //   commentsNumbers.add(value.docs.length);
        //   print(value.docs.length);
        // });
        // print(element.data());
      });
      emit(SocialGetPostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SocialGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String? postId){
    FirebaseFirestore.instance
    .collection('posts')
    .doc(postId)
    .collection('likes')
    .doc(userModel!.uId)
    .set({
      'like':true,
    }).then((value) {
      emit(SocialLikePostsSuccessState());
    }).catchError((error){
      emit(SocialLikePostsErrorState(error.toString()));
    });

  }


  void commentPost({String? postId,String? comment}){
    FirebaseFirestore.instance
    .collection('posts')
    .doc(postId)
    .collection('comments')
    .doc(userModel!.uId)
    .set({
      'comment':comment,
    }).then((value) {
      emit(SocialCommentPostsSuccessState());
    }).catchError((error){
      emit(SocialCommentPostsErrorState(error.toString()));
    });

  }
  List<SocialUserModel> users = [];
  void getUsers(){
    emit(GetAllUsersLoadingState());
    if(users.length==0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if(element.data()['uId']!=userModel!.uId)
          users.add(SocialUserModel.fromJson(element.data()));
      });
      emit(GetAllUsersSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetAllUsersErrorState(error.toString()));
    });
  }


void sendMessage({
    required String? receiverId,
    required String dateTime,
    required String text,
}){
    print(receiverId);

    MessageModel model = MessageModel(
      senderId: userModel!.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
    );
//send to sender
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).collection('chats').doc(receiverId).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error){
      emit(SocialSendMessageErrorState(error.toString()));
    });
//send to receiver
    FirebaseFirestore.instance.collection('users').doc(receiverId).collection('chats').doc(userModel!.uId).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error){
      emit(SocialSendMessageErrorState(error.toString()));
    });
}



}