import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                'https://image.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg'
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mohamed Elsayed',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ],
                  ),
                  // Text(
                  //   '${model.dateTime}',
                  //   style: Theme.of(context).textTheme.caption?.copyWith(
                  //     height: 1.3,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                size: MediaQuery.of(context).size.width * 0.06,
              ),
              onPressed: () {},
            ),
          ],
        );
      },

    );
  }
}
