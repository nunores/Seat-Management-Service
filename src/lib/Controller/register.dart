import 'package:flutter/material.dart';
import '../main.dart';

class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    var confirmPasswordField = Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
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

    var registerButton = Container(
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
          "Register",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );

    var login = Column(
      children: [
        FlatButton(
          child: Text(
            "Sign in instead",
            style: TextStyle(
              color: Colors.lightBlue[900],
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF98C1D9),
      /*appBar: AppBar(
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
      ),*/
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
            confirmPasswordField,
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            registerButton,
            SizedBox.fromSize(
              size: Size.fromHeight(10),
            ),
            login,
          ],
        ),
      ),
    );
  }
}
