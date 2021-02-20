import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Screens/Pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 3 Flutter Basic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

// class MyCupertinoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'Task 2 Basic - UI design Payment Card',
//       debugShowCheckedModeBanner: false,
//       home: PaymentCard(),
//     );
//   }
// }
