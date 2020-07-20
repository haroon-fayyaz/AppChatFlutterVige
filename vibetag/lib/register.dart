import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/Chat_List.dart';
import 'package:vibetag/Login.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Signup(),
    );
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
          alignment: Alignment.centerLeft,
          child: Image.asset('images/logo.jpg'),
        ),
        Text(
          'Signup',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 24,
            color: const Color(0xff707070),
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: false,
            icon: Icon(Icons.person),
            hintText: 'Username',
          ),
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: false,
            icon: Icon(Icons.email),
            hintText: 'Email',
          ),
          textAlign: TextAlign.left,
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: false,
            icon: Icon(Icons.lock),
            hintText: 'Password',
          ),
          textAlign: TextAlign.left,
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            filled: false,
            icon: Icon(Icons.lock),
            hintText: 'Confirm Password',
          ),
          textAlign: TextAlign.left,
        ),
        SelectGender(),
        Row(
          children: <Widget>[
            CheckBoxClass(),
            Text(
              'By creating your account, your are agree\nto our terms of use & privacy policy ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: const Color(0xff6b6b6b),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        RaisedButton(
          onPressed: () {
            _openLoginScreen(context);
          },
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
              'Register',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Do not have an account ? ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0xff6e6e6e),
              ),
              textAlign: TextAlign.left,
            ),
            FlatButton(
              child: Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: const Color(0xff4585fe),
                ),
                textAlign: TextAlign.left,
              ),
              onPressed: () {
                //TODO: Register label Pressed
              },
            ),
          ],
        )
      ],
    ));
//        ],
//      ),

//    );
  }

  void _openLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new ChatList()));
  }
}

class CheckBoxClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckBox();
}

class _CheckBox extends State<StatefulWidget> {
  bool _checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Checkbox(
      value: _checkBoxVal,
      activeColor: Colors.orange,
      onChanged: (newValue) {
        setState(() {
          _checkBoxVal = newValue;
        });
      },
    );
  }
}

class SelectGender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectGender();
}

class _SelectGender extends State<StatefulWidget> {
  static const genders = <String>[
    "Male",
    "Female",
  ];

  String _selectedGender;

  List<DropdownMenuItem<String>> _dropDownMenuItems = genders
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      trailing: DropdownButton<String>(
        value: _selectedGender,
        hint: Container(
            width: 330,
            child: Text("Select Gender", textAlign: TextAlign.left)),
        onChanged: (String newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        items: this._dropDownMenuItems,
      ),
    );
  }
}
