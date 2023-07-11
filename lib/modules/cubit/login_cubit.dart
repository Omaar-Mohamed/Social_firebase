import 'package:bloc/bloc.dart';
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
      emit(RegisterSuccessState());
      print(value.user!.email);
      print(value.user!.uid);
  }
  ).catchError((error) {
    emit(RegisterErrorState(error.toString()));
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
      emit(LoginSuccessState());
      print(value.user!.email);
      print(value.user!.uid);
    }
    ).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

}