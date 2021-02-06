part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Blogging", style: titleFontStyle),
              SizedBox(height: 50.0),
              CustomTextField(cIcon: Icons.person, clabel: "Full Name"),
              CustomTextField(cIcon: Icons.email, clabel: "Valid Email"),
              CustomTextField(cIcon: Icons.lock, clabel: "Password"),
              CustomTextField(cIcon: Icons.lock, clabel: "Confirm Password"),
              CustomRoundedButton(
                cTxt: "Sign Up",
                cTxtColor: Colors.blue,
                cBgColor: Colors.white,
                cBottom: 18.0,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: whiteFontStyle,
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: blackFontStyle.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
