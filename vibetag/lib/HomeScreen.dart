import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/Follow_Screen.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'Post.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signup': (BuildContext context) => new SignupPage(),
      },
      home: new HomeScreenList(),
    );
  }
}

class HomeScreenList extends StatefulWidget {
  @override
  _HomeScreenListState createState() => new _HomeScreenListState();
}

class _HomeScreenListState extends State<HomeScreenList>
    with SingleTickerProviderStateMixin {
  TabController tabController;

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
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    var widthD = screenSize.width;
    var heightD = screenSize.height;
    return new Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xfffffffc),
          title: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: GestureDetector(
              child: Image.asset(
                'images/logo.jpg',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ),
          ),
          automaticallyImplyLeading: true,
          bottom: getTabBar(),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: 24,
              ),
              color: Color(0xFFAAAAAA),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.near_me,
                size: 24,
              ),
              color: Color(0xFFF69222),
              onPressed: () {},
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: getTabBarPages());
  }

  Widget getTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(
          icon: Icon(
        Icons.home,
        color: Colors.grey,
      )),
      Tab(
          icon: Icon(
        Icons.group,
        color: Colors.grey,
      )),
      Tab(
          icon: Icon(
        Icons.notifications,
        color: Colors.grey,
      )),
      Tab(
          icon: Icon(
        Icons.person,
        color: Colors.grey,
      )),
    ]);
  }

  Widget getTabBarPages() {
    var widthD = MediaQuery.of(context).size.width;
    return TabBarView(controller: tabController, children: <Widget>[
      Container(
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(24.0),
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
                          width: 30,
                          height: 30,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 175,
                        height: 43,
                        child: Container(
                          alignment: Alignment.center,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
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
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            color: Color(0xfff7f7f7),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                            width: 20.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                size: 19,
                              ),
                              color: Colors.grey,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            color: Color(0xfff7f7f7),
                            margin: EdgeInsets.fromLTRB(0, 0, 25, 3),
                            width: 20.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.photo,
                                size: 19,
                              ),
                              color: Colors.grey,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: ListTile(
                            title: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Image(
                                          image: AssetImage(getPost.userImage),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(40),
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
                                            fontFamily: '.AppleSystemUIFont',
                                            fontSize: 14,
                                            color: const Color(0xff343434),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          getPost.picStatus,
                                          style: TextStyle(
                                            fontFamily: '.AppleSystemUIFont',
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
                                                color: const Color(0xff707070),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            InkResponse(
                                              child: Icon(
                                                Icons.settings,
                                                color: Color(0xff707070),
                                                size: 14,
                                              ),
                                              onTap: () {},
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            InkResponse(
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Color(0xff707070),
                                                    size: 18),
                                              ),
                                              onTap: () {
                                                print('yes, $index');
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: FractionalOffset.centerRight,
                                        child: InkResponse(
                                          child: Icon(Icons.more_vert,
                                              color: Color(0xff707070),
                                              size: 30),
                                          onTap: () {
                                            print('hello');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: Column(
                                    children: <Widget>[
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
                                                child: InkResponse(
                                                  child: Text(
                                                    'Comments ' + '$comments',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          '.AppleSystemUIFont',
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xff707070),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    print('hhh');
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                      //padding: EdgeInsets.all(0),
                                      width: 73,
                                      child: FlatButton.icon(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          size: 11,
                                        ),
                                        label: Text(
                                          'Like',
                                          style: TextStyle(fontSize: 11.0),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      //padding: EdgeInsets.all(0),
                                      width: 80,
                                      child: FlatButton.icon(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          size: 11,
                                        ),
                                        label: Text(
                                          'Dislike',
                                          style: TextStyle(fontSize: 11.0),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      //padding: EdgeInsets.all(0),
                                      width: 73,
                                      child: FlatButton.icon(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          size: 11,
                                          color: Colors.red,
                                        ),
                                        label: Text(
                                          'Love',
                                          style: TextStyle(fontSize: 11.0),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: FractionalOffset.centerRight,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: FlatButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.comment,size: 12,),
                                            label: Text(
                                              'Comment',
                                              style: TextStyle(
                                                fontFamily:
                                                    '.AppleSystemUIFont',
                                                fontSize: 11,
                                                color: const Color(0xff707070),
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
      ),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellowAccent)
    ]);
  }

  void _openLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => new HomeScreenList()));
  }

  void _navigateToBackScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FollowScreen()));
  }
}
