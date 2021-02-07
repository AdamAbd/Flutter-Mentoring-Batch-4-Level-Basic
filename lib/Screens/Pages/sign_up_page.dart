part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  Text("Blogging", style: titleFontStyle),
                  SizedBox(height: 50.0),
                  CustomTextField(cIcon: Icons.person, clabel: "Full Name"),
                  CustomTextField(cIcon: Icons.email, clabel: "Valid Email"),
                  CustomTextField(
                    cIcon: Icons.lock,
                    clabel: "Password",
                    cObscureText: true,
                  ),
                  CustomTextField(
                    cIcon: Icons.lock,
                    clabel: "Confirm Password",
                    cObscureText: true,
                  ),
                  CustomRoundedButton(
                    cTxt: "Sign Up",
                    cTxtColor: Colors.blue,
                    cBgColor: Colors.white,
                    cBottom: 18.0,
                    cRoute: () {},
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
          ],
        ),
      ),
    );
  }
}
