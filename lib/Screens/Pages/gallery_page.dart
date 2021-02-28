part of 'pages.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<ModelGallery> listModel = [];
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
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
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
                  child: GridTile(
                    child: Container(
                      child: Image.network(nDataList.photo),
                      color: Colors.white,
                    ),
                    footer: Text(nDataList.title),
                  ),
                );
              },
            ),
    );
  }
}

class DetailBerita extends StatelessWidget {
  final List<ModelGallery> listModel;
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
                  listModel[index].photo,
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
                  listModel[index].dataWhat,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       title: Text(listModel[index].title),
      //       floating: true,
      //       expandedHeight: 200,
      //     ),
      // ListView(
      //   children: <Widget>[
      //     Image.network(listModel[index].photo),
      //     Container(
      //       padding: EdgeInsets.all(32.0),
      //       child: Expanded(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Container(
      //               padding: EdgeInsets.only(bottom: 8.0),
      //               child: Text(
      //                 listModel[index].title,
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold, color: Colors.brown),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(32.0),
      //       child: Text(
      //         listModel[index].dataWhat,
      //         softWrap: true,
      //       ),
      //     )
      //   ],
      // ),
      //   ],
      // ),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Floating App Bar';

//     return MaterialApp(
//       title: title,
//       home:
//     );
//   }
// }
