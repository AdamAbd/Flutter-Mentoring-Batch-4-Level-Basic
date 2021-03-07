part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  ProfilePage(this.username);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Icon(Icons.person),
        ),
        Text("Selamat Datang"),
        Text(username),
      ],
    );
  }
}
