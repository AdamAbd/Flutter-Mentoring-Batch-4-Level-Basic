part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelGallery> listModel = [];
  List<ModelNews> listNews = [];

  var loading = false;
  var _loading = false;

  Future<Null> getData() async {
    setState(() {
      loading = true;
    });
    final responeseData = await http.get(
        "http://coba-database.000webhostapp.com/coba_database/gallery.php");
    if (responeseData.statusCode == 200) {
      final data = jsonDecode(responeseData.body);
      setState(() {
        for (Map i in data) {
          listModel.add(ModelGallery.fromJson(i));
        }
        loading = false;
      });
    }
  }

  Future<Null> getNews() async {
    setState(() {
      _loading = true;
    });
    final responeseData = await http
        .get("http://coba-database.000webhostapp.com/coba_database/news.php");
    if (responeseData.statusCode == 200) {
      final data = jsonDecode(responeseData.body);
      setState(() {
        for (Map i in data) {
          listNews.add(ModelNews.fromJson(i));
        }
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getNews();
  }

  @override
  void dispose() {
    super.dispose();
    getData();
    getNews();
  }

  createDialog(BuildContext context, List<ModelGallery> listModel, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(listModel[index].title),
          content: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140.0,
                margin: EdgeInsets.only(top: 8.0),
                child: Image.network(
                  listModel[index].photo,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  listModel[index].content,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pop(context);
              },
              textStyle: TextStyle(color: Colors.red),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: loading
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 10.0),
                      child: Text(
                        'Berita Utama',
                        style: GoogleFonts.openSans(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 180.0,
                      child: _loading
                          ? Center(child: CupertinoActivityIndicator())
                          : CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, index, _) {
                                return GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          listNews[index].picture,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  footer: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    color: Colors.white54,
                                    child: Text(
                                      listNews[index].title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 10.0),
                      child: Text(
                        'Galeri',
                        style: GoogleFonts.openSans(fontSize: 18),
                      ),
                    ),
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listModel.length,
                      itemBuilder: (context, index) {
                        final nDataList = listModel[index];
                        return InkWell(
                          onTap: () {
                            createDialog(context, listModel, index);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140.0,
                            padding: EdgeInsets.only(bottom: 20.0),
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: GridTile(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      nDataList.photo,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              footer: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                color: Colors.white60,
                                child: Text(
                                  nDataList.title,
                                  style: GoogleFonts.openSans(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
