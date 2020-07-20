import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: 375.0,
            height: 812.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
          ),
          Container(
            width: 375.0,
            height: 812.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
          ),
          Container(
            width: 375.0,
            height: 812.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
          ),
          Transform.translate(
              //Used to display Vibetag Logo
              offset: Offset(79.0, 113.0),
              child: Column(
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
              )),
          Transform.translate(
            //Used to display Login Logo
            offset: Offset(49.0, 256.0),
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Text(
                    'Login', //Login logo
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
          ),
          Transform.translate(
              //Used to display textbox and hint for email/username
              offset: Offset(15, 330),
              child: Column(
                children: <Widget>[
                  Container(
                      child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      icon: Icon(Icons.email),
                      hintText: 'Username/Email',
                    ),
                    textAlign: TextAlign.left,
                  ))
                ],
              )),
          Transform.translate(
              //Used to display textbox and hint for Password
              offset: Offset(15, 420),
              child: Column(
                children: <Widget>[
                  Container(
                      child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                    ),
                    textAlign: TextAlign.left,
                  ))
                ],
              )),
          Transform.translate(
            //Used to display Login Button
            offset: Offset(90.0, 510.0),
            child: Column(
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
                )
              ],
            ),
          ),
          Transform.translate(
              //Used to display "Do not have an Account?" label
              offset: Offset(85.0, 600.0),
              child: Column(
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
                  )
                ],
              )),
          Transform.translate(
              //Used to display "Register" label when pressed
              offset: Offset(250.0, 586.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xff4585fe),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () {
                        _openSignUpPage(context);
                        // When Register label Pressed
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void _openChatScreen(BuildContext context) {
    print('Hello');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new ChatList()));
  }

  void _openSignUpPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new Signup()));
  }
}
