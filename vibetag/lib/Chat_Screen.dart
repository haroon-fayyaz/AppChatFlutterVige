import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/main.dart';
import 'package:emoji_picker/emoji_picker.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new ChatScreenPage(),
    );
  }
}

class ChatScreenPage extends StatefulWidget {
  @override
  _ChatScreenPageState createState() => new _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
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
        bottomNavigationBar: SingleChildScrollView(
          child: BottomAppBar(
            color: Color(0xfffffffc),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 0, 2),
                    padding: EdgeInsets.all(0),
                    width: 30.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.attach_file,
                        size: 22,
                      ),
                      color: Color(0xFFF69222),
                      onPressed: () {
                        print('attach');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 30.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.image,
                        size: 22,
                      ),
                      color: Color(0xFFF69222),
                      onPressed: () {
                        print('Image');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 30.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 22,
                      ),
                      color: Color(0xFFF69222),
                      onPressed: () {
                        print('camera');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 30.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.mic,
                        size: 24,
                      ),
                      color: Color(0xFFF69222),
                      onPressed: () {
                        print('mic');
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38.0),
                        color: const Color(0xfff7f7f7),
                        border: Border.all(
                            width: 0.3, color: const Color(0xff707070)),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 175,
                            child: Container(
                              alignment: Alignment.center,
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hoverColor: Colors.yellow,
                                  hintText: 'Write your message here',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xffa0a0a0),
                                  ),
                                ),
                                maxLines: null,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            color: Color(0xfff7f7f7),
                            margin: EdgeInsets.fromLTRB(0, 0, 4, 3),
                            width: 30.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.insert_emoticon,
                                size: 19,
                              ),
                              color: Color(0xFFF69222),
                              onPressed: () {
                                print('a');
                                EmojiPicker(
                                  rows: 3,
                                  columns: 7,
                                  buttonMode: ButtonMode.CUPERTINO,
                                  recommendKeywords: ["racing","horse"],
                                  numRecommended: 10,
                                  onEmojiSelected: (emoji,category){
                                    print(emoji);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    padding: EdgeInsets.all(0),
                    width: 20.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 24,
                      ),
                      color: Color(0xFFF69222),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.asset('images/man_pic.jpg'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                child: Text(
                  'Linda',
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
            IconButton(
              icon: Icon(
                Icons.phone,
                size: 24,
              ),
              color: Color(0xFFF69222),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.videocam,
                size: 24,
              ),
              color: Color(0xFFF69222),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 24,
              ),
              color: Color(0xFFF69222),
              onPressed: () {},
            ),
          ],
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      margin: EdgeInsets.fromLTRB(25, 45, 25, 45),
                      decoration: BoxDecoration(
                        color: Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          ClipOval(
                            //borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'images/man_pic.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'You’re following Linda Pual',
                                  maxLines: null,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    color: const Color(0xff707070),
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  Text(
                                    'Living in United Kingdom',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 13,
                                      color: const Color(0xffB8B8B0),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(3.0),
                            child: Image.asset('images/man_pic.jpg')),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          constraints: BoxConstraints(
                              minWidth: 75, maxWidth: widthD - 175),
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            'Hello!',
                            maxLines: null,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                              minWidth: 100, maxWidth: widthD - 175),
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffF39524),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Text(
                            'Hello!',
                            maxLines: null,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(3.0),
                            child: Image.asset('images/man_pic.jpg')),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void _navigateToBackScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
}
