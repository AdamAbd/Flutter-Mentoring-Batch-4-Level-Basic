part of 'pages.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<ModelNews> listModel = [];
  var loading = false;

  Future<Null> getData() async {
    setState(() {
      loading = true;
    });
    final responeseData = await http
        .get("http://coba-database.000webhostapp.com/coba_database/news.php");
    if (responeseData.statusCode == 200) {
      final data = jsonDecode(responeseData.body);
      setState(() {
        for (Map i in data) {
          listModel.add(ModelNews.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CupertinoActivityIndicator())
        : ListView.builder(
            itemCount: listModel.length,
            itemBuilder: (context, index) {
              final nDataList = listModel[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return DetailBerita(listModel, index);
                    },
                  ));
                },
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(nDataList.title,
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2),
                              width: 220.0,
                            ),
                            Text(
                              nDataList.registrationDate.toString(),
                              style: GoogleFonts.openSans(
                                fontSize: 12.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            image: NetworkImage(
                              nDataList.picture,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

class DetailBerita extends StatelessWidget {
  final List<ModelNews> listModel;
  final int index;
  DetailBerita(this.listModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Container(
                      width: 92.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(8.0)),
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      width: 92.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(8.0)),
                        color: Colors.white54,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
                        Text("Kembali",
                            style: GoogleFonts.openSans(
                              fontSize: 14.0,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  listModel[index].picture,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
              expandedHeight: 300.0,
            ),
          ];
        },
        body: Scrollbar(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        listModel[index].title,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        listModel[index].registrationDate.toString(),
                        style: GoogleFonts.openSans(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  listModel[index].content +
                      "\n\nPenulis: " +
                      listModel[index].writter,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFAB(),
    );
  }
}
