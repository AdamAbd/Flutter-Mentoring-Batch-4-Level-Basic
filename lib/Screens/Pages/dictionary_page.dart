part of 'pages.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  List<ModelDictionary> listModel = [];
  List<ModelDictionary> search = [];

  var loading = false;

  Future<Null> getData() async {
    setState(() {
      loading = true;
    });
    final responeseData = await http.get(
        "http://coba-database.000webhostapp.com/coba_database/dictionary.php");
    if (responeseData.statusCode == 200) {
      final data = jsonDecode(responeseData.body);
      setState(() {
        for (Map i in data) {
          listModel.add(ModelDictionary.fromJson(i));
        }
        loading = false;
      });
    }
  }

  TextEditingController searchController = TextEditingController();

  onSearch(String text) async {
    search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    listModel.forEach((f) {
      if (f.title.contains(text) || f.id.toString().contains(text))
        search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: CupertinoNavigationBar(
        middle: Text("Kamus Peternakan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              color: Colors.blue,
              child: CupertinoTextField(
                controller: searchController,
                onChanged: onSearch,
                // expands: true,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Icon(Icons.search, color: Colors.grey[400]),
                ),
                prefixMode: OverlayVisibilityMode.notEditing,
                placeholder: "Search",
                clearButtonMode: OverlayVisibilityMode.editing,
              ),
            ),
            loading
                ? Center(child: CupertinoActivityIndicator())
                : Container(
                    height: MediaQuery.of(context).size.height - 103,
                    child:
                        search.length != 0 || searchController.text.isNotEmpty
                            ? ListView.builder(
                                itemCount: search.length,
                                itemBuilder: (context, i) {
                                  final nDataList = search[i];
                                  return ExpansionTile(
                                    title: Text(nDataList.title),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(nDataList.content),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: listModel.length,
                                itemBuilder: (context, index) {
                                  final nDataList = listModel[index];
                                  return ExpansionTile(
                                    title: Text(nDataList.title),
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(nDataList.content),
                                      ),
                                    ],
                                  );
                                },
                              ),
                  ),
          ],
        ),
      ),
    );
  }
}
