import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
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
            itemBuilder: (context, index) => buildPostItem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
  Widget buildPostItem(BuildContext context) => Card(
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
                    'https://img.freepik.com/free-photo/cute-ai-generated-cartoon-bunny_23-2150288877.jpg?t=st=1689368568~exp=1689372168~hmac=68d62541df0c10b6bd0cdfe5ffa09da2a48b35bbaef504351d867f0ece62e0af&w=740'),
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
                          'Omaar Mohamed',
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
                      'January 21, 2021 at 11:00 PM',
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
            'loram ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
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
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/men-photographing-mountain-peak-sunrise-technology-assists-generated-by-ai_188544-29923.jpg?t=st=1689375998~exp=1689379598~hmac=f95882ab583f19fe1c4e417873b3d23617f3ee3cc51890ae774f5db113adfc19&w=1060'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
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
                          '120',
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
                  onTap: () {},
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
                          '120 comments',
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
                      'https://img.freepik.com/free-photo/cute-ai-generated-cartoon-bunny_23-2150288877.jpg?t=st=1689368568~exp=1689372168~hmac=68d62541df0c10b6bd0cdfe5ffa09da2a48b35bbaef504351d867f0ece62e0af&w=740'),
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
                  onTap: () {},
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
  );}
