part of 'pages.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Kamus Peternakan"),
      ),
      body: Container(),
    );
  }
}
