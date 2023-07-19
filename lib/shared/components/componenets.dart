import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    child: Divider(
      height: 10,
      thickness: 2,
      color: Colors.grey,
      indent: 10,
      endIndent: 10,
    ),
  ),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinsh(
    context,
    widget,
    )=>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder:(context)=>widget,
    ),
          (route) => false,

    );
void navigateAndReplace(
    context,
    widget,
    )=>
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder:(context)=>widget,
    ),

    );

PreferredSizeWidget defaultAppbar(
    {
      required BuildContext context,
      String? title,
      List<Widget>? actions,
      Widget? leading,
    }) =>AppBar(
  leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.arrow_back,
    ),
  ),
  title: Text(
    title??'',
  ),
  titleSpacing: 5.0,
  actions: actions,
);