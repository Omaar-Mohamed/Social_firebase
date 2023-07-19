import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:firebase_project_one/shared/components/componenets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../edit_profile/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = SocialCubit.get(context);
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                                image: NetworkImage(
                                  '${userModel!.cover}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.18,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.17 ,
                          backgroundImage: NetworkImage(
                            '${userModel!.image}',
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('${userModel!.name}',
                  style: Theme.of(context).textTheme.bodyText1),
              Text(
                '${userModel!.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text('100',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text('250',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'photos',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text('40k',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text('150',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Following',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            navigateTo(context,  EditProfile());
                          },
                          child: Text('Edit Profile'))),

                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
