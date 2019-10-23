import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePage();
  }
}

class ProfilePage extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("images/picture.jpg"),
            ),
            Text(
              "Md Azizul Islam",
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  "+8801923067328",
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                      letterSpacing: 2.5),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  "imazizul@gmail.com",
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade900,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
