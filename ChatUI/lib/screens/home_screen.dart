import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/widgets/Category_selector.dart';
import 'package:flutter_chat_ui_starter/widgets/Favorite_context.dart';
import 'package:flutter_chat_ui_starter/widgets/Recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          iconSize: 30.0,
          onPressed: () {},
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: <Widget>[
        CategorySelector(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: <Widget>[FavoriteContacts(), RecentChats()],
            ),
          ),
        )
      ]),
    );
  }
}
