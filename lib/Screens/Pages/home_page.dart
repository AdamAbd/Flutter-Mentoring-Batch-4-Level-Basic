part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelGallery> listModel = [];
  List<ModelNews> listNews = [];

  var loading = false;

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
      loading = true;
    });
    final responeseData = await http
        .get("http://coba-database.000webhostapp.com/coba_database/news.php");
    if (responeseData.statusCode == 200) {
      final data = jsonDecode(responeseData.body);
      setState(() {
        for (Map i in data) {
          listNews.add(ModelNews.fromJson(i));
        }
        loading = false;
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
                      margin: EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 10.0),
                      child: Text(
                        'Berita Utama',
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 180.0,
                      child: CarouselSlider.builder(
                        itemCount: listNews.length,
                        itemBuilder: (context, index, _) {
                          return GridTile(
                            child: Container(
                              child: Image.network(
                                listNews[index].picture,
                                fit: BoxFit.cover,
                              ),
                            ),
                            footer: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              color: Colors.black26,
                              child: Text(
                                listNews[index].title,
                                style: TextStyle(
                                  color: Colors.white,
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
                      margin: EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 10.0),
                      child: Text(
                        'Galeri',
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                    ),
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listModel.length,
                      itemBuilder: (context, index) {
                        final nDataList = listModel[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: GridTile(
                            child: Container(
                              child: Image.network(
                                nDataList.photo,
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                            footer: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              color: Colors.white54,
                              child: Text(
                                nDataList.title,
                                style: GoogleFonts.openSans(),
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
