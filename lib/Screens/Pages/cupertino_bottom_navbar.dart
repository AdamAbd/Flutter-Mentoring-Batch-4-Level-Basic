part of "pages.dart";

class CBNB extends StatefulWidget {
  CBNB({Key key}) : super(key: key);
  @override
  _CBNBState createState() => _CBNBState();
}

class _CBNBState extends State<CBNB> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('PeternakanApp', style: GoogleFonts.openSans()),
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          NewsPage(),
          ProfilePage(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'News',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: CustomFAB(),
    );
  }
}
