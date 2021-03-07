part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "https://coba-database.000webhostapp.com/coba_database/login.php";
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Selamat Datang",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => CBNB(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Username and password invalid!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CupertinoNavigationBar(
        middle: Text("Login"),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/foto_kuceng_rounded.jpg",
                width: 140.0,
                height: 140.0,
              ),
              SizedBox(height: 20.0),
              CupertinoTextField(
                clearButtonMode: OverlayVisibilityMode.editing,
                placeholder: "Nama Pengguna",
                controller: user,
              ),
              SizedBox(height: 10.0),
              CupertinoTextField(
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                placeholder: "Kata Sandi",
                controller: pass,
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 35.0,
                child: FlatButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "Tidak punya akun? ",
                  style: GoogleFonts.openSans(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Daftar",
                      style: GoogleFonts.openSans(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
