part of 'widgets.dart';

class CustomRoundedButton extends StatelessWidget {
  final String cTxt;
  final Color cTxtColor, cBgColor;
  final double cBottom;
  final Function cRoute;

  CustomRoundedButton({
    this.cTxt,
    this.cTxtColor,
    this.cBgColor,
    this.cBottom,
    this.cRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.0,
      margin: EdgeInsets.only(bottom: cBottom),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: (cTxtColor == null)
            ? Text(
                cTxt,
                style: whiteFontStyle,
              )
            : Text(
                cTxt,
                style: blackFontStyle.copyWith(color: cTxtColor),
              ),
        color: cBgColor,
        onPressed: (cRoute == null) ? () {} : cRoute,
      ),
    );
  }
}
