part of 'pages.dart';

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.crop_square_rounded)),
              Tab(icon: Icon(Icons.square_foot)),
            ],
          ),
          title: Text("Math Calculator"),
        ),
        body: TabBarView(
          children: [
            CalculatePage(),
            ConvertionaPage(),
          ],
        ),
      ),
    );
  }
}
