import 'package:flutter/material.dart';
import '../database.dart';
import '../main.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

enum ProfileOptions { logout }

class AddConference extends StatelessWidget {
  static const String _title = 'Main Page';

  final Database database;

  AddConference(this.database);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(this.database),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Database database;

  MyStatefulWidget(this.database, {Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(this.database);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Database database;

  _MyStatefulWidgetState(this.database);

  DateTime _selectedDate;
  DateTime _dateTime = DateTime.now();

  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Container datePicker = Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: DatePickerWidget(
        looping: false, // default is not looping
        firstDate: DateTime.now(), //DateTime(1960),
        //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
        initialDate: DateTime.now(),
        lastDate: DateTime(2022, 12, 31),
        dateFormat: "dd-MMMM-yyyy",
        //   "dd-MMMM-yyyy",
        //     locale: DatePicker.localeFromString('he'),
        onChange: (DateTime newDate, _) {
          _selectedDate = newDate;
          print(_selectedDate);
        },
        pickerTheme: DateTimePickerTheme(
          itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
          dividerColor: Colors.blue,
          backgroundColor: Color(0xFF98C1D9),
        ),
      ),
    );

    Container hourPicker = Container(
      //height: 50,
      child: TimePickerSpinner(
        isForce2Digits: true,
        is24HourMode: true,
        spacing: 10,
        minutesInterval: 1,
        onTimeChange: (time) {
          setState(() {
            _dateTime = time;
          });
        },
      ),
    );

    Container nomeField = Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: nameController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Nome da Palestra',
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
          hintText: 'Localização',
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                            builder: (context) => MyHomePage(
                                  database: this.database,
                                )));
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
                IconData(59648, fontFamily: 'MaterialIcons'),
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
            height: 50,
          ),
          nomeField,
          SizedBox(
            height: 50,
          ),
          locationField,
          datePicker,
          hourPicker,
        ],
      ),
    );
  }
}
