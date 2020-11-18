import 'package:flutter/material.dart';
import '../main.dart';
import '../database.dart';
import '../Model/user.dart';
import 'main_page.dart';

class RegisterRoute extends StatelessWidget {
  final Database database;
  User newUser;

  RegisterRoute(this.database);

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  User findUser(String user, String pass) {
    for (var i = 0; i < database.getUsers().length; i++) {
      if ((database.getUsers()[i].getUser() == user) &&
          (database.getUsers()[i].getPass() == pass)) {
        return database.getUsers()[i];
      }
    }
    return null;
  }

  bool verifyUser(String user, String pass) {
    for (var i = 0; i < database.getUsers().length; i++) {
      if ((database.getUsers()[i].getUser() == user) &&
          (database.getUsers()[i].getPass() == pass)) {
        return true;
      }
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Invalid Input"),
      content: Text("The credentials you input are not valid"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var passwordField = Container(
      child: TextField(
        controller: passwordController,
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
        controller: confirmPasswordController,
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
        controller: usernameController,
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
          if ((passwordController.text == confirmPasswordController.text) &&
              !verifyUser(usernameController.text, passwordController.text) &&
              ((passwordController.text != "") &&
                  (usernameController.text != ""))) // If the user doesn't exist
          {
            this.newUser =
                new User(usernameController.text, passwordController.text);

            this.database.addUser(this.newUser);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainPage(this.newUser, this.database)));
          } else {
            showAlertDialog(context);
          }
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
