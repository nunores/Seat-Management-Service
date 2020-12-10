import 'package:Seat_Manager/Controller/admin_main_page.dart';
import 'package:Seat_Manager/Model/date.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/palestra.dart';
import '../database.dart';

class ManageConference extends StatelessWidget {
  static const String _title = 'Edit Conference';

  final Palestra palestra;
  final User user;
  final Database database;

  ManageConference(this.palestra, this.user, this.database);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(this.palestra, this.user, this.database),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final User user;
  final Palestra palestra;
  final Database database;

  MyStatefulWidget(this.palestra, this.user, this.database, {Key key})
      : super(key: key);

  @override
  _MyStatefulWidgetState createState() =>
      _MyStatefulWidgetState(this.palestra, this.user, this.database);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Palestra palestra;
  User user;
  Database database;

  Color color_seat = Colors.black;
  int idSelector = -1;

  _MyStatefulWidgetState(this.palestra, this.user, this.database);

  DateTime _firstDateTime;
  DateTime _secondDateTime;



  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController(text: this.palestra.name);
    TextEditingController locationController = new TextEditingController(text: this.palestra.location);
    Container datePicker = Container(
        height: 170,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            children:
            [
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',// default is not looping
                initialValue: DateTime(this.palestra.firstDate.year, this.palestra.firstDate.month,
                    this.palestra.firstDate.day, this.palestra.firstDate.hour, this.palestra.firstDate.min).toString(),
                firstDate: DateTime(2000),
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
                dateMask: 'd MMM, yyyy',// default is not looping
                initialValue: DateTime(this.palestra.secondDate.year, this.palestra.secondDate.month,
                    this.palestra.secondDate.day, this.palestra.secondDate.hour, this.palestra.secondDate.min).toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),

                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: 'Hour',
                onChanged: (date) => _secondDateTime = DateTime.parse(date),
              )
            ]
        )
    );

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

    var editButton = Container(
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
          //if (verifyDates(_firstDateTime, _secondDateTime)) {
          this.database.editPalestra(this.palestra, nameController.text,
            new Date(_firstDateTime.year, _firstDateTime.month,
              _firstDateTime.day, _firstDateTime.hour,
              _firstDateTime.minute),
            new Date(_secondDateTime.year, _secondDateTime.month,
            _secondDateTime.day, _secondDateTime.hour,
            _secondDateTime.minute),
          locationController.text);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainPageAdmin(this.user, this.database)));
          /*} else{
            showAlertDialog(context);
          }*/
        },
        child: Text(
          "Edit Conference",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );

    var removeButton = Container(
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
          this.database.removePalestra(palestra);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainPageAdmin(this.user, this.database)));
          /*} else{
            showAlertDialog(context);
          }*/
        },
        child: Text(
          "Remove Conference",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );

    return Scaffold(
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
            height:40,
          ),
          datePicker,
          SizedBox(
            height: 70,
          ),
          editButton,
          SizedBox(
            height: 20,
          ),
          removeButton,
        ],
      ),
    );
  }
}