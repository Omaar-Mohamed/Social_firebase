import 'package:flutter/material.dart';

class SocialLayout extends StatelessWidget {
   SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: const Center(
          child: Text(
            'Hello, World!',
          ),
        ),
    );
  }
}
