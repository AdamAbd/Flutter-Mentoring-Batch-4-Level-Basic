part of 'pages.dart';

class ConvertionaPage extends StatefulWidget {
  @override
  _ConvertionaPageState createState() => _ConvertionaPageState();
}

class _ConvertionaPageState extends State<ConvertionaPage> {
  final fieldText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void clearText() {
    fieldText.clear();
  }

  String _startMeasure;
  String _convertedMeasure;
  double _numberForm;
  List<String> _resultMessage;
  var _enableBtn = false;

  void initState() {
    _numberForm = 0;
    super.initState();
  }

  final List<String> _measures = [
    'MM',
    'CM',
    'DM',
    'M',
    'DAM',
    'HM',
    'KM',
  ];
  final Map<String, int> _measuresMap = {
    'MM': 0,
    'CM': 1,
    'DM': 2,
    'M': 3,
    'DAM': 4,
    'HM': 5,
    'KM': 6,
  };

  dynamic _formulas = {
    '0': [1, 0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001],
    '1': [10, 1, 0.1, 0.01, 0.001, 0.0001, 0.00001],
    '2': [100, 10, 1, 0.1, 0.01, 0.001, 0.0001],
    '3': [1000, 100, 10, 1, 0.1, 0.01, 0.001],
    '4': [10000, 1000, 100, 10, 1, 0.1, 0.01],
    '5': [100000, 10000, 1000, 100, 10, 1, 0.1],
    '6': [1000000, 100000, 10000, 1000, 100, 10, 1],
  };

  void convert(double value, String from, String to) {
    int nFrom = _measuresMap[from];
    int nTo = _measuresMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = ['This conversion cannot be performed'].toList();
    } else {
      _resultMessage = ["${result.toString()}", " $_convertedMeasure"].toList();
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
                /// Bagian memilih konversi 1
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                      style: inputStyle,
                      isExpanded: true,
                      hint: Text("Pilih Unit", style: inputStyle),
                      items: _measures.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _startMeasure = value;
                        });
                      },
                      value: _startMeasure,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                /// Bagian memasukkan angka
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value.length < 1
                        ? 'Input angka tidak boleh kosong'
                        : null,
                    decoration: InputDecoration(
                      hintText: "Masukkan Angka",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: clearText,
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
                          _numberForm = rv;
                        });
                      }
                    },
                    controller: fieldText,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_downward),
                ),

                /// Bagian memilih konversi 2
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                      style: inputStyle,
                      isExpanded: true,
                      hint: Text(
                        "Pilih Unit",
                        style: inputStyle,
                      ),
                      items: _measures.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _convertedMeasure = value;
                        });
                      },
                      value: _convertedMeasure,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                /// Button konversi
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
                        Text('Konversi', style: TextStyle(color: Colors.white)),
                    onPressed: _enableBtn
                        ? () {
                            if (_startMeasure.isEmpty ||
                                _convertedMeasure.isEmpty ||
                                _numberForm == 0) {
                              return;
                            } else {
                              convert(_numberForm, _startMeasure,
                                  _convertedMeasure);
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.grey[200],
                      ),
                      child: (_resultMessage == null)
                          ? Center(
                              child: Text("Hasil", style: labelStyle),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _resultMessage[0].toString(),
                                  style: labelStyle,
                                ),
                                Text(
                                  _resultMessage[1].toString(),
                                  style: labelStyle.copyWith(
                                    color: Colors.grey,
                                  ),
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
                                    "${_resultMessage[0]}${_resultMessage[1]}",
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
