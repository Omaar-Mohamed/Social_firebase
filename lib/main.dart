import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project_one/layout/home/social_layout.dart';
import 'package:firebase_project_one/modules/login/login_screen.dart';
import 'package:firebase_project_one/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

import 'modules/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
// options: const FirebaseOptions(
//       appId: '1:1051656340180:android:0b9e2a0b0e9e2a0b0e9e2a',
//       messagingSenderId: '1051656340180',
//       projectId: 'flutter-project-1-2e1e9',
//       apiKey: 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY',
//     ),
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
