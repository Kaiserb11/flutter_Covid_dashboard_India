import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueGrey[700],
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'COVID 19 STATS',
        style: TextStyle(
          color: Colors.yellowAccent[700],
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 20,
        ),
      ),
      leading: IconButton(
        color: Colors.yellowAccent[700],
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: (){},
      ),
      actions: <Widget>[
        IconButton(
          color: Colors.yellowAccent[700],
          icon: const Icon(Icons.notifications_none),
          iconSize: 28,
          onPressed: (){},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}