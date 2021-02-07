part of 'pages.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Create a Post",
          style: titleFontStyle.copyWith(fontSize: 18.0),
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: TextField(
                    style: blackFontStyle.copyWith(fontSize: 15.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "What is flutter?",
                      hintStyle: blackFontStyle.copyWith(fontSize: 15.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: TextField(
                    maxLines: 14,
                    decoration: InputDecoration(
                      hintText:
                          "Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
                      hintStyle: blackFontStyle.copyWith(fontSize: 15.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: CustomRoundedButton(
                    cTxt: "Publish",
                    cBottom: 0.0,
                    cBgColor: mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
