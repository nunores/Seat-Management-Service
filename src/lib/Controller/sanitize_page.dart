import 'package:Seat_Manager/Controller/admin_main_page.dart';
import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/palestra.dart';
import '../database.dart';
import 'manage_conference.dart';

class SanitizationPage extends StatelessWidget {
  static const String _title = 'Reservation Page';

  final Palestra palestra;
  final User user;
  final Database database;

  SanitizationPage(this.palestra, this.user, this.database);

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

  Color colorSeat = Colors.black;
  int idSelector = -1;

  _MyStatefulWidgetState(this.palestra, this.user, this.database);

  Expanded getSeats() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 11,
        children: getSeatsList(),
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  List<IconButton> getSeatsList() {
    List<IconButton> seatsList = List<IconButton>();

    for (var i = 0; i < 99; i++) {
      if (this.palestra.getSeats()[i] == -1) {
        colorSeat = Colors.yellow;
      } else if (this.palestra.getSeats()[i] == 0) {
        colorSeat = Colors.white;
      } else if (this.palestra.getSeats()[i] == 1) {
        colorSeat = Colors.red[300];
      }
      if ((idSelector == i) &&
          (this.palestra.getSeats()[i] != -1) &&
          (this.palestra.getSeats()[i] != 1)) colorSeat = Colors.green[500];
      seatsList.add(IconButton(
        icon: Icon(
          const IconData(59147, fontFamily: 'MaterialIcons'),
          size: 30,
          color: colorSeat,
        ),
        onPressed: () {},
      ));
    }

    return seatsList;
  }

  Column getPalestraInfo() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Column(
            children: <Widget>[
              // Name
              Container(
                child: Text(
                  this.palestra.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.topLeft,
                padding:
                    EdgeInsets.only(top: 10, left: 25, bottom: 10, right: 25),
              ),
              // Location
              Container(
                child: Row(children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    const IconData(62168, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                    size: 30,
                    semanticLabel: 'Location',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.palestra.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ]),
                padding: EdgeInsets.only(bottom: 10),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      const IconData(58915, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 30,
                      semanticLabel: 'Date',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.palestra.firstDate.printDate(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      IconData(0xe55b, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 30,
                      semanticLabel: 'Time',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      this.palestra.firstDate.printTime(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(bottom: 10),
              ),
              // Time
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      IconData(58915, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 30,
                      semanticLabel: 'Date',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.palestra.secondDate.printDate(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      IconData(0xe55b, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 30,
                      semanticLabel: 'Time',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      this.palestra.secondDate.printTime(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container getGoBackButton(BuildContext context) {
    return Container(
      child: IconButton(
        color: Colors.white,
        icon: Icon(const IconData(61562, fontFamily: 'MaterialIcons')),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainPageAdmin(this.user, this.database)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getGoBackButton(context),
/*             Container(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 55,
              ),
              margin: EdgeInsets.all(10),
            ), */
          ],
        ),
      ),
      backgroundColor: Color(0xFF98C1D9),
      body: Column(
        children: [
          getPalestraInfo(),
          getSeats(),
          SizedBox(
            height: 70,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(this.user);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ManageConference(this.palestra, this.user, this.database)),
          );
        },
        child: Icon(const IconData(59109, fontFamily: 'MaterialIcons')),
        backgroundColor: Color(0xFF293241),
      ),
    );
  }
}
