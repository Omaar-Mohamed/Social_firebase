import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_one/modules/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  // late CourseModel courseModel;
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  void Register(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
emit(RegisterLoadingState());
FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: email, password: password)
    .then((value) {
      // emit(RegisterSuccessState());  // good note deleted to solve the conflict of two methodos
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(name: name, email: email, phone: phone, uId: value.user!.uid);
  }
  ).catchError((error) {
    emit(RegisterErrorState(error.toString()));
  });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
}){
emit(SocialCreateUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).set({
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': 'https://image.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
      'cover': 'https://img.freepik.com/free-photo/3d-cartoon-background-children_23-2150473126.jpg?w=826&t=st=1689743391~exp=1689743991~hmac=7d790d7216df58df79e936d5a26b6ef6b1ded8fd0b40540c419b88c09d0a95e0',
      'bio': 'write your bio ...',
      'isEmailVerified': false,
    }).then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
    });
}

  void Login(
      {
        required String email,
        required String password,
      }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
      print(value.user!.email);
      print(value.user!.uid);
    }
    ).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }



}