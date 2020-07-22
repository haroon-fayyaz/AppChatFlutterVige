import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class _SetupProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
        //'/otostop': (BuildContext context) => new OtoStop7Temp()
        // '/otostop': (BuildContext context) => new Message()
      },
      home: new SetupProfileState(),
    );
  }
}

class SetupProfileState extends StatefulWidget {
  @override
  SetupProfile createState() => new SetupProfile();
}

DateTime _date = DateTime.now();

class SetupProfile extends State<SetupProfileState> {
  List<String> _gender = ['Male', 'Female']; // List for the options for Gender
  String _selectedGender; // String selected for
  bool _checkBoxVal = true;
  final _dateController = TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        //_datePicker.toString();
        String day=_datePicker.day.toString();
        String month=_datePicker.month.toString();
        String year=_datePicker.year.toString();
        _dateController.text="$day-$month-$year";
        print(_datePicker.toString());
        _date = _datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
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
                offset: Offset(79.0, 90.0),
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
                //Used to display textbox and hint for First Name
                offset: Offset(25, 190),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: false,
                        hintText: 'First Name',
                      ),
                      textAlign: TextAlign.left,
                    ))
                  ],
                )),
            Transform.translate(
                //Used to display textbox and hint for Last Name
                offset: Offset(25, 268),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: false,
                        hintText: 'Last Name',
                      ),
                      textAlign: TextAlign.left,
                    ))
                  ],
                )),
            Transform.translate(
              //Used to display 'Save and Continue' Button
              offset: Offset(90.0, 700.0),
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
                        'Save and Continue',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
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
              //Used to show DropDown Menu for selection of Gender
              offset: Offset(100.0, 323.0),
              child: DropdownButton(
                hint: Text('Please Select a Gender'),
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: _gender.map((gender) {
                  return DropdownMenuItem(
                    child: new Text(gender),
                    value: gender,
                  );
                }).toList(),
              ),
            ),
            Transform.translate(
              //Used to display eligibiity label
              offset: Offset(70.0, 450.0),
              child: Text(
                'Tick this if you are not 13, But 12 Parent(s)\nGuardian(s), Please complete this Area.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: const Color(0xff6b6b6b),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              //Used to check the tick box
              offset: Offset(25, 440),
              //TODO: by checking text
              child: CheckBoxClass(),
            ),
            Transform.translate(
                //used to display Parents/Guardians name
                offset: Offset(25, 510),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: false,
                        hintText: 'Parent/Guardian Name',
                      ),
                      textAlign: TextAlign.left,
                    ))
                  ],
                )),
            Transform.translate(
              //Used to display identity label
              offset: Offset(20, 580),
              child: Text(
                'Parent/Guardian\nIdentity Proof.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: const Color(0xff6b6b6b),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              //Used to display 'Choose File' button
              offset: Offset(90.0, 625.0),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 235,
                      height: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            const Color(0xfffe7e45),
                            const Color(0xfffe7e45)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Choose File',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
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
                //Used to display Date Picker
                offset: Offset(0.0, 360.0),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      autovalidate: true,
                      onTap: () {
                        setState(() {
                          _selectDate(context);
                          print(_date);

                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Select Date',
                          icon: Icon(Icons.calendar_today),
                          labelStyle: TextStyle(fontSize: 12)),
                    )))
          ],
        ),
      ),
    );
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
