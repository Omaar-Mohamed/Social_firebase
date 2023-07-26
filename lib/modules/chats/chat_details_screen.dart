import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen extends StatelessWidget {
  String? name;
  String? image;
  String? reseverId;
  final TextEditingController messageController = TextEditingController();

  ChatDetailsScreen({Key? key , this.name, this.image,this.reseverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.04,
                  backgroundImage: NetworkImage(
                    '${image}',
                  ) ,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  '${name}',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    height: 1.3,
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildFriendMessage(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                buildMyMessage(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'type your message here ...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        SocialCubit.get(context).sendMessage(
                          receiverId: reseverId,
                          dateTime: DateTime.now().toString(),
                          text: messageController.text,
                        );
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );

  }

  Widget buildFriendMessage(BuildContext context)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      child: Text(
        'message' ,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          height: 1.3,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
          bottomEnd: Radius.circular(10.0),
        ),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
    ),
  );
  Widget buildMyMessage(BuildContext context)=> Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      child: Text(
        'message' ,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          height: 1.3,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
          bottomStart: Radius.circular(10.0),
        ),
        color: Colors.blue[300],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
    ),
  );

}
