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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    border: Border.all(color: Colors.grey[300])),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset('images/man_pic.jpg')),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: Text(
                'Chats',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(

              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.blue,
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
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
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
              itemCount: Names.length,
              itemBuilder: (context, index) {
                var title = Names.elementAt(index);
                return Card(
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(3.0),
                                child: Image.asset('images/man_pic.jpg')),
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
                              title,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: const Color(0xff727272),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),

                            /*Status*/
                            Text(
                              'Hey there! How are you',
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
