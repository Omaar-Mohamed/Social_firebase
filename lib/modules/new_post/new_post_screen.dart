import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/componenets.dart';

class NewPostScreen extends StatelessWidget {
   NewPostScreen({Key? key}) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {
        if(state is SocialCreatePostSuccessState)
          {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Post Created Successfully'),
              backgroundColor: Colors.grey,
            ),
          );
          }
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: defaultAppbar(context: context, title: 'Create Post',
              actions: [
                TextButton(
                  onPressed: () {
                   if(SocialCubit.get(context).postImage == null)
                     {
                        SocialCubit.get(context).createPost(
                          dateTime: DateTime.now().toString(),
                          text: textController.text,
                        );
                     } else
                       {
                         SocialCubit.get(context).uploadPostImage(
                           dateTime: DateTime.now().toString(),
                           text: textController.text,
                         );
                       }
                  },
                  child: Text(
                    'POST',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).userModel!.image}'
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${SocialCubit.get(context).userModel!.name}',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              height: 1.3,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: FileImage(SocialCubit.get(context).postImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                        icon: CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            SocialCubit.get(context).getPostImage();
                          }
                          , child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )

                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){}
                          , child: const Text(
                            '# tags',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )

                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
