import 'package:flutter/material.dart';
import 'package:vibetag/Chat_List.dart';
import 'package:vibetag/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/chat_list': (BuildContext context) => new ChatList(),
      },
      home: new Login(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Text('Next'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new ChatList()));
            },
          ),
        ],
      ),
    );
  }
}
