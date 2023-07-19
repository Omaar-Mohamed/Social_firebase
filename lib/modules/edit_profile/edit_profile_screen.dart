import 'dart:io';

import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:firebase_project_one/shared/components/componenets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
   EditProfile({Key? key}) : super(key: key);
  TextEditingController nameController=TextEditingController();
  TextEditingController bioController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=SocialCubit.get(context);
        var userModel=SocialCubit.get(context).userModel;
        var profileImage=SocialCubit.get(context).profileImage;
        var coverImage=SocialCubit.get(context).coverImage;
        nameController.text=userModel!.name!;
        bioController.text=userModel.bio!;
        return Scaffold(
          appBar: defaultAppbar(
            context: context,
            title: 'Edit Profile',
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'UPDATE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),

          body:Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.29,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                image: coverImage ==null? NetworkImage(
                                  '${userModel!.cover}',
                                ):FileImage(coverImage) as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                SocialCubit.get(context).getCoverImage();
                              },
                              icon: CircleAvatar(
                                radius: 16,
                              child: Icon(
                                Icons.camera_alt_outlined,color: Colors.white,
                              ))),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd ,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.18,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.17 ,
                              backgroundImage: profileImage ==null ? NetworkImage(
                                '${userModel!.image}',
                              ):FileImage(profileImage) as ImageProvider,

                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.camera_alt_outlined,color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'name must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                controller: bioController,
                keyboardType: TextInputType.name,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'bio must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Bio',
                  prefixIcon: Icon(
                    Icons.info_outline,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
