import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/FriendList.dart';

class FollowScreenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new FollowScreen(),
    );
  }
}

class FollowScreen extends StatefulWidget {
  @override
  _FollowScreenState createState() => new _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  MediaQueryData queryData;

  static List<String> Names = [
    'Professor',
    'Nairobi',
    'Tokyo',
    'Berlin',
  ];

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    var widthD = queryData.size.width;
    var heightD = queryData.size.height;
    return new Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Follow our favourite Users',
                    style: TextStyle(
                      fontFamily: '.AppleSystemUIFont',
                      fontSize: 21,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: Text(
                    'Get latest activities from our popular\nUsers',
                    style: TextStyle(
                      fontFamily: '.AppleSystemUIFont',
                      fontSize: 16,
                      color: const Color(0xff3b3a3a),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ShowList(idx: 0,),
                      ),
                      Expanded(
                        child: ShowList(idx: 1,),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
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
                      'Follow 10 & finish',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new Friend_List()));
  }
}

class ShowList extends StatefulWidget {
  final int idx;

  ShowList({Key key, this.idx}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShowList(idx: idx);
}

class _ShowList extends State<StatefulWidget> {
  final int idx;

  _ShowList({this.idx});

  static List<String> imagePaths = [
    'images/person.jpg',
    'images/person_2.jpg',
    'images/person_3.jpg',
    'images/person_4.jpg',
  ];
  static List<String> imagePaths2 = [
    'images/man_2.jpg',
    'images/person_5.jpg',
    'images/person_6.jpg',
    'images/person_7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: this.idx == 0 ? imagePaths.length : imagePaths2.length,
        itemBuilder: (context, index) {
          var path = this.idx == 0 ? imagePaths.elementAt(index) : imagePaths2.elementAt(index);
          return Card(
            child: ListTile(
              title: GestureDetector(
                child: Card(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(path),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffffffff),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
