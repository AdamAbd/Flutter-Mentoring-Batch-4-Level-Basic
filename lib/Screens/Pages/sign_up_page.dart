part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 18.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Blogging", style: titleFontStyle),
              SizedBox(height: 50.0),
              Container(
                margin: EdgeInsets.only(bottom: 18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: whiteFontStyle.copyWith(fontSize: 15.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: whiteFontStyle.copyWith(fontSize: 15.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      border: OutlineInputBorder(),
                      labelText: 'Valid Email',
                      labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: whiteFontStyle.copyWith(fontSize: 15.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      border: OutlineInputBorder(),
                      labelText: 'Valid Email',
                      labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: whiteFontStyle.copyWith(fontSize: 15.0),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      border: OutlineInputBorder(),
                      labelText: 'Valid Email',
                      labelStyle: whiteFontStyle.copyWith(fontSize: 15.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
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
