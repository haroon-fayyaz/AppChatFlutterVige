import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/Chat_Screen.dart';
import 'package:vibetag/Follow_Screen.dart';
import 'package:vibetag/FriendList.dart';
import 'package:vibetag/HomeScreen.dart';
import 'package:vibetag/SetupProfile.dart';
import 'package:vibetag/UserProfile.dart';
import 'package:vibetag/register.dart';

import 'Chat_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
        //'/otostop': (BuildContext context) => new OtoStop7Temp()
        // '/otostop': (BuildContext context) => new Message()
      },
      home: new Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
              SizedBox(height: 130.0),
              Column(
                children: <Widget>[
                  Container(
                    width: 218.0,
                    height: 79.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/logo.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                onTap: () {
                  print("yes");
                  _openChatScreen(context);
                },
              ),
              SizedBox(height: 40.0),
              Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffe7e45)),
                        ),
                        filled: false,
                        icon: Icon(
                          Icons.email,
                          color: Color(0xfffe7e45),
                        ),
                        hintText: 'Username/Email',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Column(
                children: <Widget>[
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfffe7e45)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xfffe7e45)),
                          ),
                          filled: false,
                          icon: Icon(Icons.lock, color: Color(0xfffe7e45)),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xfffe7e45),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 235,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            const Color(0xfffe7e45),
                            const Color(0xffffb100)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Do not have an account?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: const Color(0xff6e6e6e),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Column(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xfffe7e45),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () {
                        _openSignUpPage(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openChatScreen(BuildContext context) {
    print('Hello');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new FollowScreen()));
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => new ChatScreen()));
  }

  void _openSignUpPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new Signup()));
  }
}
