import 'package:firebase_project_one/models/post_model.dart';
import 'package:firebase_project_one/modules/cubit/social_cubit.dart';
import 'package:firebase_project_one/modules/cubit/social_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(SocialCubit.get(context).posts.length == 0 && SocialCubit.get(context).posts.length == 0 && SocialCubit.get(context).likes.length == 0 && SocialCubit.get(context).comments.length == 0 && SocialCubit.get(context).commentsNumbers.length == 0 )
                LinearProgressIndicator(),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10.0,
                margin: EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/live-such-moments-as-these_329181-8366.jpg?w=996&t=st=1689371411~exp=1689372011~hmac=4d70c99c4600bc73dec197cdf446c01ae0822501d3d983183a626dcb7feb0443'),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'communicate with friends',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildPostItem(SocialCubit.get(context).posts[index], context,index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: SocialCubit.get(context).posts.length,
              ),
            ],
          ),
        );
      },

    );
  }
  Widget buildPostItem(PostModel model, BuildContext context ,index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10.0,
    margin: EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    '${model.image}'
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
                          '${model.name}',
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
                    Text(
                      '${model.dateTime}',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        height: 1.3,
                      ),
                    ),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          Text(
            '${model.text}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 4.0,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        '#software',
                        style: TextStyle(color: Colors.blue),
                      ),
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      child: Text(
                        '#development',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (model.postImage != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
                0.0, 15.0, 0.0, 0.0
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: NetworkImage(
                      '${model.postImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: MediaQuery.of(context).size.width * 0.055,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          '${SocialCubit.get(context).likes[index]}',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    SocialCubit.get(context).commentPost(postId: SocialCubit.get(context).postsId[index],comment: 'comment');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.comment,
                          size: MediaQuery.of(context).size.width * 0.055,
                          color: Colors.amber[400],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          '${SocialCubit.get(context).commentsNumbers[index]} comments',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.04,
                  backgroundImage: NetworkImage(
                      '${SocialCubit.get(context).userModel!.image}'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: Text(
                    'write a comment...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: MediaQuery.of(context).size.width * 0.055,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),

  );
}
