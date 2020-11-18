import 'package:flutter/material.dart';
import 'Controller/register.dart';
import 'Controller/main_page.dart';
import 'database.dart';
import 'Model/user.dart';

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

  final Database database = new Database();

  @override
  _MyHomePageState createState() => _MyHomePageState(database);
}

class _MyHomePageState extends State<MyHomePage> {
  Database database;

  _MyHomePageState(this.database);

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool verifyUser(String user, String pass) {
    for (var i = 0; i < database.getUsers().length; i++) {
      if ((database.getUsers()[i].getUser() == user) &&
          (database.getUsers()[i].getPass() == pass)) {
        return true;
      }
    }
    return false;
  }

  User findUser(String user, String pass) {
    for (var i = 0; i < database.getUsers().length; i++) {
      if ((database.getUsers()[i].getUser() == user) &&
          (database.getUsers()[i].getPass() == pass)) {
        return database.getUsers()[i];
      }
    }
    return null;
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
    var register = Column(
      children: [
        Text(
          "Don't have an account yet?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        FlatButton(
          child: Text(
            "Register Here",
            style: TextStyle(
              color: Colors.lightBlue[900],
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterRoute(this.database)),
            );
          },
        ),
      ],
    );

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
          if (verifyUser(
              this.usernameController.text, this.passwordController.text)) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(
                        findUser(this.usernameController.text,
                            this.passwordController.text),
                        this.database)));
          } else {
            showAlertDialog(context);
          }
        },
        child: Text(
          "Log In",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );

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

    return Scaffold(
      backgroundColor: Color(0xFF98C1D9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            usernameField,
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            passwordField,
            SizedBox.fromSize(
              size: Size.fromHeight(30),
            ),
            loginButton,
            SizedBox.fromSize(
              size: Size.fromHeight(10),
            ),
            register,
          ],
        ),
      ),
    );
  }
}
