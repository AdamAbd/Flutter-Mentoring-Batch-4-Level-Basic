part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fieldUsername = TextEditingController();
  final fieldPassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String _txtUsername, _txtPassword, _resultMessage;
  bool _enableBtn = false;

  void clearUsername() {
    fieldUsername.clear();
    _txtUsername = "";
  }

  void clearPassword() {
    fieldPassword.clear();
    _txtPassword = "";
  }

  void initState() {
    _txtUsername = "";
    _txtPassword = "";
    super.initState();
  }

  void check(String txtEmail, String txtPassword) {
    String emailData = "udacodingid";
    String passwordData = "udacodingJaya2021";

    if (txtEmail != emailData && txtPassword != passwordData) {
      _resultMessage = "Email & Password yang anda masukkan salah";
    } else if (txtEmail != emailData) {
      _resultMessage = "Email yang anda masukkan salah";
    } else if (txtPassword != passwordData) {
      _resultMessage = "Password yang anda masukkan salah";
    } else {
      return null;
    }

    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode:
                AutovalidateMode.always, //check for validation while typing
            key: _formkey,
            onChanged: () =>
                setState(() => _enableBtn = _formkey.currentState.validate()),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/images/ic_launcher.png')),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearUsername,
                      ),
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
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearPassword,
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Wajib"),
                      MinLengthValidator(6,
                          errorText: "Password harus lebih dari 6 karakter"),
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
                    style: TextStyle(color: Colors.blue, fontSize: 13),
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
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
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
                                Scaffold.of(context).showSnackBar(snackbar);
                              } else if (_txtUsername != emailData) {
                                final snackbar = SnackBar(
                                  content:
                                      Text("Email yang anda masukkan salah"),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              } else if (_txtPassword != passwordData) {
                                final snackbar = SnackBar(
                                  content:
                                      Text("Password yang anda masukkan salah"),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              } else {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => TabBarPage()));
                              }
                            }
                          : null,
                      // onPressed: () {
                      //   if (_formkey.currentState.validate()) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => TabBarPage()));
                      //     print("Validated");
                      //   } else {
                      //     print("Not Validated");
                      //   }
                      // },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
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
