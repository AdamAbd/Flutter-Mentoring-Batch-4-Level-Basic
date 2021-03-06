import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Screens/Pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 4 Flutter Basic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CBNB(),
    );
  }
}

// import 'dart:convert';
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'model_berita.dart';

// class PageHomeBerita extends StatefulWidget {
//   @override
//   _PageHomeBeritaState createState() => _PageHomeBeritaState();
// }

// class _PageHomeBeritaState extends State<PageHomeBerita> {
//   // membuat list dari modelnya
// List<News> listModel = [];
// var loading = false;

// Future<Null> getData() async {
//   setState(() {
//     loading = true;
//   });
//   final responeseData = await http.get(
//       "http://coba-database.000webhostapp.com/coba_database/get_news.php");
//   if (responeseData.statusCode == 200) {
//     final data = jsonDecode(responeseData.body);
//     setState(() {
//       for (Map i in data) {
//         listModel.add(News.fromJson(i));
//       }
//       loading = false;
//     });
//   }
// }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//   // Future<List> getData() async {
//   //   final response = await http.get(
//   //       "http://coba-database.000webhostapp.com/coba_database/get_news.php");
//   //   return json.decode(response.body);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Apps Berita'),
//         backgroundColor: Colors.brown,
//       ),
//       body: Container(
//         child: loading
//             ? Center(child: CircularProgressIndicator())
//             : ListItem(listModel: listModel),
//       ),
//       // FutureBuilder<List>(
//       //   future: getData(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.hasError) print(snapshot.error);
//       //     return snapshot.hasData
//       //         ? ItemList(list: snapshot.data)
//       //         : Center(child: CircularProgressIndicator());
//       //   },
//       // ),
//     );
//   }
// }

// class ListItem extends StatelessWidget {
//   const ListItem({
//     Key key,
//     @required this.listModel,
//   }) : super(key: key);

//   final List<News> listModel;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: listModel.length,
//       itemBuilder: (context, index) {
//         final nDataList = listModel[index];
//         return Container(
//           padding: EdgeInsets.all(10.0),
//           child: GestureDetector(
// onTap: () {
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return DetailBerita(listModel, index);
//   }));
//             },
//             child: Card(
//               child: ListTile(
//                 title: Text(
//                   nDataList.title,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.brown,
//                   ),
//                 ),
//                 subtitle: Text(nDataList.registrationDate.toString()),
//                 trailing: Image.network(
//                   nDataList.picture,
//                   fit: BoxFit.cover,
//                   width: 60.0,
//                   height: 60.0,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         return Container(
//           padding: EdgeInsets.all(10.0),
//           child: GestureDetector(
//             onTap: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (context) {
//               //   return DetailBerita(list, index);
//               // }));
//             },
//             child: Card(
//               child: ListTile(
//                 title: Text(
//                   list[index]['title'],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.brown,
//                   ),
//                 ),
//                 subtitle: Text("Tanggal :${list[index]['registrationDate']}"),
//                 trailing: Image.network(
//                   list[index]['picture'],
//                   fit: BoxFit.cover,
//                   width: 60.0,
//                   height: 60.0,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class DetailBerita extends StatelessWidget {
//   final List<News> listModel;
//   int index;
//   DetailBerita(this.listModel, this.index);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(listModel[index].title),
//         backgroundColor: Colors.brown,
//       ),
//       body: ListView(
//         children: <Widget>[
//           Image.network(listModel[index].picture),
//           Container(
//             padding: EdgeInsets.all(32.0),
//             child: Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       listModel[index].title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.brown),
//                     ),
//                   ),
//                   Text(listModel[index].registrationDate.toString())
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(32.0),
//             child: Text(
//               listModel[index].content,
//               softWrap: true,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
