import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/main.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new ChatListPage(),
    );
  }
}

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => new _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  MediaQueryData queryData;

  static List<Map<String, String>> chatData = [
    {
      'name': 'Professor',
      'image': 'images/person.jpg',
      'message': 'Hey there! How are you',
    },
    {
      'name': 'Nairobi',
      'image': 'images/person_3.jpg',
      'message': 'Hi! How are you',
    },
    {
      'name': 'Tokyo',
      'image': 'images/person_5.jpg',
      'message': 'Thank you!',
    },
    {
      'name': 'Berlin',
      'image': 'images/person_7.jpg',
      'message': 'Bye!',
    },
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
                  'images/person_2.jpg',
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: Text(
                'Chats',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          Container(
            child: Icon(
              Icons.more_vert,
              color: Colors.blueGrey,
            ),
            alignment: Alignment.center,
            width: 45,
          ),
        ],
      ),
      // resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Color(0xfffe7e45),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      maxLines: null,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
            margin: EdgeInsets.all(25),
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xfff7f7f7),
              border: Border.all(width: 0.3, color: const Color(0xff707070)),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                var person = chatData.elementAt(index);
                return Card(
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            child: ClipOval(
                                child: Image.asset(
                              person['image'],
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            /*Name*/
                            Text(
                              person['name'],
                              style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),

                            /*Status*/
                            Text(
                              person['message'],
                              style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: const Color(0xff727272),
                              fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: Text(
                              '30 min ago',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: const Color(0xff727272),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _navigateToBackScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
}
