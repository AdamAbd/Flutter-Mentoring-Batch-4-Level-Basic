part of 'widgets.dart';

class CustomTextField extends StatefulWidget {
  final String clabel;
  final IconData cIcon;

  CustomTextField({this.clabel, this.cIcon});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.0),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
        ),
        child: TextField(
          cursorColor: Colors.white,
          style: whiteFontStyle.copyWith(fontSize: 15.0),
          decoration: InputDecoration(
            prefixIcon: Icon(widget.cIcon, color: Colors.white),
            border: OutlineInputBorder(),
            labelText: widget.clabel,
            labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
