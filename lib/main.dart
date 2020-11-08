import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Management Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Seat Management Service'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var loginButton = Container(
      child: FlatButton(
        color: Color(0xFFEE6C4D),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(150)),
        ),
        onPressed: () {
          /*...*/
        },
        child: Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
          )
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );

    var passwordField = Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
    );

    var usernameField = Container(
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Username',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(150)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
    );

    return Scaffold(
      backgroundColor: Color(0xFF98C1D9),
      appBar: AppBar(
        backgroundColor: Color(0xFF293241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 40,
              ),
              margin: EdgeInsets.only(left: 10),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            usernameField,
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            passwordField,
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            loginButton,
          ],
        ),
      ),
    );
  }
}
