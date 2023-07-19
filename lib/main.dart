import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project_one/layout/home/social_layout.dart';
import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/login/login_screen.dart';
import 'package:firebase_project_one/modules/settings/settings_screen.dart';
import 'package:firebase_project_one/shared/bloc_observer.dart';
import 'package:firebase_project_one/shared/constants/constants.dart';
import 'package:firebase_project_one/shared/network/local/cache_helper(shared_prefrenceds).dart';
import 'package:firebase_project_one/shared/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();


  Widget widget;
  uId = CacheHelper.getData(key: 'uId');
  if (uId != '') {
    widget= SocialLayout();
  } else {
    widget= LoginScreen();
  }


  runApp( MyApp(
       startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
   MyApp({
     super.key,
     required this.startWidget
   });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

          BlocProvider(
            create: (BuildContext context) => SocialCubit()..getUserData(),
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
