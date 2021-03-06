part of 'widgets.dart';

class CustomFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DictionaryPage();
          },
        ));
      },
      child: Icon(Icons.menu_book_rounded, color: Colors.white),
    );
  }
}
