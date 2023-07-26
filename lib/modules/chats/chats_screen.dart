import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_project_one/models/social_user_model.dart';
import 'package:firebase_project_one/modules/chats/chat_details_screen.dart';
import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:firebase_project_one/shared/components/componenets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (BuildContext context) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => chatItem(context,SocialCubit.get(context).users[index]),
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1.0,
                thickness: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: SocialCubit.get(context).users.length,
            );
          },
          fallback: (BuildContext context) {
            return LinearProgressIndicator();
          },

        );
      },

    );
  }

  Widget chatItem(BuildContext context,SocialUserModel model)=> InkWell(
    onTap: (){
      navigateTo(context, ChatDetailsScreen(image: model.image,name: model.name,reseverId: model.uId,));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              '${model.image}' ?? '',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
              height: 1.3,
            ),
          ),

        ],
      ),
    ),
  );
}
