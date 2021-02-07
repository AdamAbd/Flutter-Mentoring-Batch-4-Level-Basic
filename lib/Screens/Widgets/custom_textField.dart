part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  final String clabel;
  final IconData cIcon;
  final bool cObscureText;

  CustomTextField({this.clabel, this.cIcon, this.cObscureText});

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
          obscureText: (cObscureText != null) ?? true,
          decoration: InputDecoration(
            prefixIcon: Icon(cIcon, color: Colors.white),
            border: OutlineInputBorder(),
            labelText: clabel,
            labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
