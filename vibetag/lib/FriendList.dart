import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/Follow_Screen.dart';

class Friend_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new FriendList(),
    );
  }
}

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => new _FriendListState();
}

class _FriendListState extends State<FriendList> {
  MediaQueryData queryData;
  String Username = "Paul Smith";
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
      appBar: AppBar(
        backgroundColor: Color(0xfffffffc),
        title: Row(
          children: <Widget>[
            GestureDetector(
              child: Container(
                child: Icon(Icons.arrow_back, color: Color(0xffffad00)),
                alignment: Alignment.topLeft,
                width: 40,
              ),
              onTap: () {
                _navigateToBackScreen(context);
              },
            ),
            GestureDetector(
              child: Container(
                child: ClipOval(
                    child: Image.asset(
                  'images/man_2.jpg',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: Text(
                Username,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
      ),
      // resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
                      child: RaisedButton(
                        /*C0CB*/
                        color: Color(0xFFFFCF90),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: const Color(0x72f39425))),
                        onPressed: () {
                          _openLoginScreen(context);
                        },
                        textColor: Colors.black,
                        child: Text(
                          'Followers',
                          style: TextStyle(
                            fontFamily: 'Baghdad',
                            fontSize: 13,
                            color: const Color(0xff030303),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width: 150,
                      child: RaisedButton(
                        /*C0CB*/
                        color: Color(0xFFf2f2f2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: const Color(0x72f39425))),
                        onPressed: () {
                          _openLoginScreen(context);
                        },
                        textColor: Colors.black,
                        child: Text(
                          'Following',
                          style: TextStyle(
                            fontFamily: 'Baghdad',
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: const Color(0xffa0a0a0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xfff7f7f7),
                    border:
                        Border.all(width: 0.3, color: const Color(0xff707070)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '399 Followers',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 14,
                      color: const Color(0xff4a4a4a),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ShowList(
                          idx: 0,
                        ),
                      ),
                      Expanded(
                        child: ShowList(
                          idx: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
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
        .push(MaterialPageRoute(builder: (context) => new FriendList()));
  }

  void _navigateToBackScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FollowScreen()));
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
          var path = this.idx == 0
              ? imagePaths.elementAt(index)
              : imagePaths2.elementAt(index);
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
