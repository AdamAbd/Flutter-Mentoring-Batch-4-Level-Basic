part of 'pages.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final fieldLength = TextEditingController();
  final fieldWidth = TextEditingController();
  final fieldHeight = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _numberLenght, _numberWidth, _numberHeight = 0.0;
  List<String> _resultMessage;
  bool _enableBtn = false;

  void clearLength() {
    fieldLength.clear();
    _numberLenght = 0;
  }

  void clearWidth() {
    fieldWidth.clear();
    _numberWidth = 0;
  }

  void clearHeight() {
    fieldHeight.clear();
    _numberHeight = 0;
  }

  void initState() {
    _numberLenght = 0;
    _numberWidth = 0;
    _numberHeight = 0;
    super.initState();
  }

  void calculate(double lenght, double width, double height) {
    var area = lenght * width;
    var volume = lenght * width * height;

    if (height == null || height == 0) {
      _resultMessage = ["Luas Persegi", "${area.toString()}", "2"].toList();
    } else {
      _resultMessage = ["Volume Kubus", "${volume.toString()}", "3"].toList();
    }

    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          onChanged: () =>
              setState(() => _enableBtn = _formKey.currentState.validate()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Bagian memasukkan panjang
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value.length < 1
                        ? 'Input panjang tidak boleh kosong'
                        : null,
                    decoration: InputDecoration(
                      hintText: "Masukkan Panjang",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixText: "m",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearLength,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberLenght = rv;
                        });
                      }
                    },
                    controller: fieldLength,
                  ),
                ),
                SizedBox(height: 22.0),

                /// Bagian memasukkan lebar
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value.length < 1
                        ? 'Input lebar tidak boleh kosong'
                        : null,
                    decoration: InputDecoration(
                      hintText: "Masukkan Lebar",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixText: "m",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearWidth,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberWidth = rv;
                        });
                      }
                    },
                    controller: fieldWidth,
                  ),
                ),
                SizedBox(height: 22.0),

                /// Bagian memasukkan tinggi
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Masukkan Tinggi",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixText: "m",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearHeight,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (text) {
                      var rv = double.tryParse(text);
                      if (rv != null) {
                        setState(() {
                          _numberHeight = rv;
                        });
                      }
                    },
                    controller: fieldHeight,
                  ),
                ),
                SizedBox(height: 31.0),

                /// Button hitung
                Container(
                  width: double.infinity,
                  height: 45.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.blue,
                    disabledColor: Colors.grey[400],
                    child:
                        Text('Hitung', style: TextStyle(color: Colors.white)),
                    onPressed: _enableBtn
                        ? () {
                            if (_numberLenght == null || _numberWidth == null) {
                              return;
                            } else {
                              calculate(
                                  _numberLenght, _numberWidth, _numberHeight);
                            }
                          }
                        : null,
                  ),
                ),
                SizedBox(height: 10.0),

                // Kolom Hasil
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 75.0,
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.grey[200],
                      ),
                      child: (_resultMessage == null)
                          ? Center(child: Text("Hasil", style: labelStyle))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _resultMessage[0].toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" = ", style: labelStyle),
                                    Text(
                                      _resultMessage[1].toString(),
                                      style: labelStyle,
                                    ),
                                    Text(" m", style: labelStyle),
                                    EasyRichText(
                                      _resultMessage[2].toString(),
                                      defaultStyle: labelStyle,
                                      patternList: [
                                        EasyRichTextPattern(
                                          targetString:
                                              _resultMessage[2].toString(),
                                          superScript: true,
                                          style: labelStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: _enableBtn
                          ? () {
                              Clipboard.setData(ClipboardData(
                                text:
                                    "${_resultMessage[1]} m${_resultMessage[2]}",
                              )).then((value) {
                                final snackBar = SnackBar(
                                  content: Text('Copied to Clipboard'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
