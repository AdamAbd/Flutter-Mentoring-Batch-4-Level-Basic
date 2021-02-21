part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fieldUsername = TextEditingController();
  final fieldPassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String _txtUsername, _txtPassword;
  bool _enableBtn = false, _obscureText = true;

  void initState() {
    _txtUsername = "";
    _txtPassword = "";
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formkey,
                  onChanged: () => setState(
                      () => _enableBtn = _formkey.currentState.validate()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// Gambar profil
                      Center(
                        child: Container(
                          width: 130.0,
                          height: 130.0,
                          child: Image.asset(
                              'assets/images/foto_kuceng_rounded.jpg'),
                        ),
                      ),

                      /// Input Username
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Wajib"),
                          ]),
                          onChanged: (text) {
                            if (text != null) {
                              setState(() {
                                _txtUsername = text;
                              });
                            }
                          },
                          controller: fieldUsername,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        child: TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                (_obscureText == true)
                                    ? Icons.lock_outline
                                    : Icons.lock_open,
                              ),
                              onPressed: _toggle,
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Wajib"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password harus lebih dari 6 karakter"),
                          ]),
                          onChanged: (text) {
                            if (text != null) {
                              setState(() {
                                _txtPassword = text;
                              });
                            }
                          },
                          controller: fieldPassword,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.blue, fontSize: 13.0),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        child: Builder(
                          builder: (context) => FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Colors.blue,
                            disabledColor: Colors.grey[400],
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: _enableBtn
                                ? () {
                                    String emailData = "udacodingid";
                                    String passwordData = "udacodingJaya2021";
                                    if (_txtUsername != emailData &&
                                        _txtPassword != passwordData) {
                                      final snackbar = SnackBar(
                                        content: Text(
                                            "Email & Password yang anda masukkan salah"),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackbar);
                                    } else if (_txtUsername != emailData) {
                                      final snackbar = SnackBar(
                                        content: Text(
                                            "Email yang anda masukkan salah"),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackbar);
                                    } else if (_txtPassword != passwordData) {
                                      final snackbar = SnackBar(
                                        content: Text(
                                            "Password yang anda masukkan salah"),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackbar);
                                    } else {
                                      return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => TabBarPage(),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: 100.0),
                    ],
                  ),
                ),
                Text('New User? Create Account')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
