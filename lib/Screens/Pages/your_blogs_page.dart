part of 'pages.dart';

class YourBlogsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openDrawer(), // And this!
        ),
        title: Text(
          "Your Blogs",
          style: titleFontStyle.copyWith(fontSize: 18.0),
        ),
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          Container(
            height: 120.0,
            padding: EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.brown,
                child: Text(
                  "W",
                  style: whiteFontStyle,
                ),
              ),
              title: Text(
                "What is dart?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Dart is a client-optimized programming language for apps on multiple platforms.It is developed ...',
                // style: blackFontStyle1,
                overflow: TextOverflow.clip,
              ),
              trailing: Text(
                'Jan 26, 2021',
                style: TextStyle(color: greyColor),
              ),
            ),
          ),
          Divider(),
          Container(
            height: 120.0,
            padding: EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.green[700],
                child: Text(
                  "W",
                  style: whiteFontStyle,
                ),
              ),
              title: Text(
                "What is flutter?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for ...',
                // style: blackFontStyle1,
                overflow: TextOverflow.clip,
              ),
              trailing: Text(
                'Jan 26, 2021',
                style: TextStyle(color: greyColor),
              ),
            ),
          ),
          Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greyColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePost(),
            ),
          );
        },
      ),
    );
  }
}
