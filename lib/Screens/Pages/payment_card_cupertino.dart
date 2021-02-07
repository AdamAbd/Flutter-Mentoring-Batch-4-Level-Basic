part of 'pages.dart';

class PaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          'Payment Card Demo',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person, size: 35.0, color: greyColor),
                    SizedBox(width: 14.0),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 77.0,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: greyColor),
                          labelText: "Card Name",
                          hintText: "Musa Adebola",
                          filled: true,
                          fillColor: Colors.black12,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  children: [
                    Container(
                      width: 35.0,
                      child: Image.asset(
                        "assets/images/verve_logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 77.0,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: greyColor),
                          labelText: "Number",
                          hintText: "5060 6666 6666 6666 666",
                          filled: true,
                          fillColor: Colors.black12,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  children: [
                    Icon(Icons.credit_card, size: 35.0, color: greyColor),
                    SizedBox(width: 14.0),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 77.0,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: greyColor),
                          labelText: "CVV",
                          hintText: "687",
                          filled: true,
                          fillColor: Colors.black12,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 35.0, color: greyColor),
                    SizedBox(width: 14.0),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width - 77.0,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: greyColor),
                          labelText: "Expiry Date",
                          hintText: "10/20",
                          filled: true,
                          fillColor: Colors.black12,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                CupertinoButton(
                  color: Colors.blue,
                  child: Text("Pay"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
