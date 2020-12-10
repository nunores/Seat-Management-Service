import 'package:Seat_Manager/Model/date.dart';
import 'package:Seat_Manager/Model/palestra.dart';
import 'package:Seat_Manager/Model/user.dart';
import 'package:flutter/material.dart';
import '../database.dart';
import '../main.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'admin_main_page.dart';

enum ProfileOptions { logout }

class AddConference extends StatelessWidget {
  static const String _title = 'Main Page';

  final Database database;
  final User user;

  AddConference(this.user, this.database);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(this.user, this.database),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Database database;
  final User user;
  MyStatefulWidget(this.user, this.database, {Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() =>
      _MyStatefulWidgetState(this.user, this.database);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Database database;
  User user;
  Palestra newPalestra;

  _MyStatefulWidgetState(this.user, this.database);

  DateTime _firstDateTime;
  DateTime _secondDateTime;

  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  verifyDates(firstDateTime, secondDateTime) {
    if (firstDateTime.year == secondDateTime.year) {
      if (firstDateTime.month == secondDateTime.month) {
        if (firstDateTime.day == secondDateTime.day) {
          if (firstDateTime.hour == secondDateTime.hour) {
            if (firstDateTime.minute >= secondDateTime.minute)
              return false;
            else
              return true;
          } else if (firstDateTime.hour > secondDateTime.hour)
            return false;
          else
            return true;
        } else if (firstDateTime.day > secondDateTime.day)
          return false;
        else
          return true;
      } else if (firstDateTime.month > secondDateTime.month)
        return false;
      else
        return true;
    } else if (firstDateTime.year > secondDateTime.year)
      return false;
    else
      return true;
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Invalid Input"),
      content: Text(
          "Either dates selected are not valid or name and/or location are empty."),
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
    Container datePicker = Container(
        height: 170,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: [
          DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'd MMM, yyyy', // default is not looping
            initialValue: DateTime.now().toString(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),

            icon: Icon(Icons.event),
            dateLabelText: 'Date',
            timeLabelText: 'Hour',
            onChanged: (date) => _firstDateTime = DateTime.parse(date),
          ),
          SizedBox(
            height: 40,
          ),
          DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'd MMM, yyyy', // default is not looping
            initialValue: DateTime.now().toString(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),

            icon: Icon(Icons.event),
            dateLabelText: 'Date',
            timeLabelText: 'Hour',
            onChanged: (date) => _secondDateTime = DateTime.parse(date),
          )
        ]));

    Container nomeField = Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: nameController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Conference',
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
    );

    Container locationField = Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: locationController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Location',
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
    );

    var addButton = Container(
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
          if (_firstDateTime == null) _firstDateTime = DateTime.now();
          if (_secondDateTime == null) _secondDateTime = DateTime.now();
          if (verifyDates(_firstDateTime, _secondDateTime) &&
              nameController.text != "" &&
              locationController.text != "") {
            var newPalestra = new Palestra(
                nameController.text,
                new Date(
                    _firstDateTime.year,
                    _firstDateTime.month,
                    _firstDateTime.day,
                    _firstDateTime.hour,
                    _firstDateTime.minute),
                new Date(
                    _secondDateTime.year,
                    _secondDateTime.month,
                    _secondDateTime.day,
                    _secondDateTime.hour,
                    _secondDateTime.minute),
                locationController.text,
                false,
                this.database.generateSeats());

            this.database.addPalestra(newPalestra);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainPageAdmin(this.user, this.database)));
          } else {
            showAlertDialog(context);
          }
        },
        child: Text(
          "Add Conference",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF293241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: IconButton(
                color: Colors.white,
                icon: Icon(IconData(61562, fontFamily: 'MaterialIcons')),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainPageAdmin(this.user, this.database)),
                  );
                },
              ),
            ),
            Container(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 55,
              ),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
        actions: [
          Container(
            child: PopupMenuButton(
              onSelected: (ProfileOptions result) {
                setState(() {
                  if (result == ProfileOptions.logout) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddConference(user, database)));
                  }
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ProfileOptions>>[
                const PopupMenuItem<ProfileOptions>(
                  value: ProfileOptions.logout,
                  child: Text('Log Out'),
                ),
              ],
              icon: Icon(
                const IconData(59648, fontFamily: 'MaterialIcons'),
                size: 50,
                color: Colors.white,
              ),
            ),
            margin: EdgeInsets.only(right: 20),
          )
        ],
      ),
      backgroundColor: Color(0xFF98C1D9),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          nomeField,
          SizedBox(
            height: 40,
          ),
          locationField,
          SizedBox(
            height: 40,
          ),
          datePicker,
          SizedBox(
            height: 70,
          ),
          addButton,
        ],
      ),
    );
  }
}
