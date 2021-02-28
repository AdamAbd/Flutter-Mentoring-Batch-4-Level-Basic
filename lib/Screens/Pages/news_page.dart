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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: loading
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
                    height: 110.0,
                    margin: EdgeInsets.only(top: 10.0),
                    child: Card(
                      child: Center(
                        child: ListTile(
                          title: Container(
                            child: Text(nDataList.title, maxLines: 3),
                            height: 70.0,
                          ),
                          subtitle: Text(nDataList.registrationDate.toString()),
                          trailing: Container(
                            height: 70.0,
                            width: 70.0,
                            child: Image.network(
                              nDataList.picture,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
              title: Text(
                'Floating app bar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
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
                padding: EdgeInsets.all(32.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          listModel[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.brown),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  listModel[index].content,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
