part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url =
        "https://coba-database.000webhostapp.com/coba_database/register.php";
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data != "Error") {
      Fluttertoast.showToast(
        msg: "Sukses Register",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Akun Sudah Ada!",
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
        middle: Text("Register"),
        previousPageTitle: "Login",
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
              Container(
                width: double.infinity,
                height: 35.0,
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Kata Sandi",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(6.0, 7.0, 6.0, 7.0),
                  ),
                  controller: pass,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 35.0,
                child: FlatButton(
                  onPressed: () {
                    register();
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
                  text: "Sudah punya akun? ",
                  style: GoogleFonts.openSans(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Masuk",
                      style: GoogleFonts.openSans(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
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
