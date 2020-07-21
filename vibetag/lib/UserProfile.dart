import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/Follow_Screen.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'Post.dart';

class User_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => new _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Size screenSize;

  static List<String> Names = [
    'Professor',
    'Nairobi',
    'Tokyo',
    'Berlin',
  ];
  String fullName = "Paul Smith";

  List<Post> posts = [
    Post(
        commentCount: '12',
        likesCount: '32',
        Changetime: '6 minutes ago',
        picStatus: 'has changes his cover pic',
        userName: "John",
        userImage: 'images/photoFollow.jpg',
        postImage: 'images/photoFollow.jpg',
        caption: 'Good to see you'),
    Post(
        commentCount: '100',
        likesCount: '50',
        Changetime: '9 minutes ago',
        picStatus: 'has changes his cover pic',
        userName: "Smith",
        userImage: 'images/photoFollow.jpg',
        postImage: 'images/photoFollow.jpg',
        caption: 'Nice Post'),
  ];

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    var widthD = screenSize.width;
    var heightD = screenSize.height;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            IconButton(
                icon: Container(
                  margin: EdgeInsets.all(25),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                  //child: Icon(Icons.arrow_back, color: Color(0xffffad00)),
                  alignment: Alignment.topLeft,
                  width: 40,
                ),
                onPressed: () {
                  print('yes');
                  _navigateToBackScreen(context);
                }),
            SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenSize.height / 5.25,
                    ),
                    _buildProfileImage(),
                    SizedBox(
                      height: 7,
                    ),
                    _buildFullName(),
                    Container(
                      width: widthD,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          var getPost = posts.elementAt(index);
                          var comments = getPost.commentCount;
                          return Card(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                              child: ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          child: Image(
                                              image:
                                                  AssetImage(getPost.userImage),
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              getPost.userName,
                                              style: TextStyle(
                                                fontFamily:
                                                    '.AppleSystemUIFont',
                                                fontSize: 14,
                                                color: const Color(0xff343434),
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              getPost.picStatus,
                                              style: TextStyle(
                                                fontFamily:
                                                    '.AppleSystemUIFont',
                                                fontSize: 13,
                                                color: const Color(0xff707070),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  getPost.Changetime,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        '.AppleSystemUIFont',
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.settings,
                                                  color: Color(0xff707070),
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkResponse(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color:
                                                            Color(0xff707070),
                                                        size: 18),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.centerRight,
                                            child: Icon(Icons.more_vert,
                                                color: Color(0xff707070),
                                                size: 30),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image(
                                      image: AssetImage(getPost.postImage),
                                      width: widthD,
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.thumb_up,
                                            color: Colors.indigoAccent,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          getPost.likesCount,
                                          style: TextStyle(
                                            fontFamily: '.AppleSystemUIFont',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 60, 0),
                                              child: Text(
                                                'Comments ' + '$comments',
                                                style: TextStyle(
                                                  fontFamily:
                                                      '.AppleSystemUIFont',
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xff707070),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        FlatButton.icon(
                                          icon: Icon(
                                            Icons.thumb_up,
                                          ),
                                          label: Text('Like'),
                                          onPressed: () {},
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.centerRight,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 35, 0),
                                              child: FlatButton.icon(
                                                onPressed: () {},
                                                icon: Icon(Icons.comment),
                                                label: Text(
                                                  'Comment',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        '.AppleSystemUIFont',
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: screenSize.height / 3.5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/photoFollow.jpg'), fit: BoxFit.cover)),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/photoFollow.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            )),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: '.AppleSystemUIFont',
      fontSize: 16,
      color: const Color(0xff3b3a3a),
      fontWeight: FontWeight.w700,
    );
    return Text(
      fullName,
      style: _nameTextStyle,
    );
  }

  void _openLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new UserProfile()));
  }

  void _navigateToBackScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FollowScreen()));
  }
}
