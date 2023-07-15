import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:firebase_project_one/modules/new_post/new_post_screen.dart';
import 'package:firebase_project_one/shared/components/componenets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
   SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {
        if(state is SocialNewPostState){
         navigateTo(context, NewPostScreen());
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit=SocialCubit.get(context);
        return Scaffold(

        appBar:AppBar(
          title: Text(cubit.titles[cubit.currentIndex]),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          ],
        ),
        body:  cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chats',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.post_add),
              //   label: 'Post',
              // ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Users',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
              ),
            ],
          ) ,
      );
        },

    );
  }
}
