import 'package:flutter/material.dart';

class ButtonFavorite extends StatefulWidget {
  @override
  _ButtonFavoriteState createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  /// Inisialisasi Func [isFavorite]
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,

        /// Func [isFavorite] berubah warna
        color: isFavorite ? Colors.red : Colors.white,
      ),
      onPressed: () {
        /// Saat button ditekan state [isFavorite] akan berubah
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
