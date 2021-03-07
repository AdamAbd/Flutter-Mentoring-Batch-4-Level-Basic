part of 'pages.dart';

class DictionaryPage extends StatefulWidget {
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
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Kamus", style: GoogleFonts.openSans()),
        previousPageTitle: "Kembali",
        backgroundColor: Colors.white,
        border: null,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      CupertinoTextField(
                        controller: searchController,
                        onChanged: onSearch,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Icon(Icons.search, color: Colors.grey[500]),
                        ),
                        prefixMode: OverlayVisibilityMode.notEditing,
                        placeholder: "Search",
                        clearButtonMode: OverlayVisibilityMode.editing,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300], width: 0.6),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 126,
              child: loading
                  ? Center(child: CupertinoActivityIndicator())
                  : (search.length != 0 || searchController.text.isNotEmpty)
                      ? ListView.builder(
                          itemCount: search.length,
                          itemBuilder: (context, i) {
                            final nDataList = search[i];
                            return Card(
                              child: ExpansionTile(
                                title: Text(
                                  nDataList.title,
                                  style: GoogleFonts.openSans(),
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      nDataList.content,
                                      style: GoogleFonts.openSans(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: listModel.length,
                          itemBuilder: (context, index) {
                            final nDataList = listModel[index];
                            return Card(
                              child: ExpansionTile(
                                title: Text(
                                  nDataList.title,
                                  style: GoogleFonts.openSans(),
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      nDataList.content,
                                      style: GoogleFonts.openSans(),
                                    ),
                                  ),
                                ],
                              ),
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
