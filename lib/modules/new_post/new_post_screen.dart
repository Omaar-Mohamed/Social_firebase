import 'package:flutter/material.dart';

import '../../shared/components/componenets.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context: context, title: 'Edit Profile', actions: [
        TextButton(
          onPressed: () {},
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
    );
  }
}
