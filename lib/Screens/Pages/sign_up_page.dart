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
              Container(
                width: double.infinity,
                height: 55.0,
                margin: EdgeInsets.only(bottom: 18.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "Sign Up",
                    style: blackFontStyle.copyWith(color: Colors.blue),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
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
