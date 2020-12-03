import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Model/palestra.dart';
import '../database.dart';
import '../Controller/main_page.dart';

class ReservedPage extends StatelessWidget {
  static const String _title = 'Reserved Page';

  final Palestra palestra;
  final User user;
  final Database database;

  ReservedPage(this.palestra, this.user, this.database);

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

  Expanded getSeats() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 11,
        children: getSeatsList(),
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget cancelButton() {
    return Container(
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
          int index = this.user.getIndexPalestra(this.palestra);
          int seat = this.user.getSeatsReserved()[index];
          this.user.palestrasGoing.removeAt(index);
          this.user.seatsReserved.removeAt(index);

          this.palestra.getSeats()[seat] = 0;

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(this.user, this.database)));
        },
        child: Text(
          "Cancel the reservation",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      height: 50,
      width: 700,
      margin: EdgeInsets.symmetric(horizontal: 70),
    );
  }

  List<IconButton> getSeatsList() {
    List<IconButton> seatsList = List<IconButton>();

    int index = this.user.getIndexPalestra(this.palestra);
    int seat = this.user.getSeatsReserved()[index];

    for (var i = 0; i < 99; i++) {
      if (this.palestra.getSeats()[i] == -1) {
        color_seat = Colors.yellow;
      } else if (this.palestra.getSeats()[i] == 0) {
        color_seat = Colors.white;
      } else if (this.palestra.getSeats()[i] == 1) {
        color_seat = Colors.red[300];
      }

      if (i == seat) {
        color_seat = Colors.black;
      }

      seatsList.add(IconButton(
        icon: Icon(
          IconData(59147, fontFamily: 'MaterialIcons'),
          size: 30,
          color: color_seat,
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
                  padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                ),
                // Location
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        IconData(62168, fontFamily: 'MaterialIcons'),
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
                        this.palestra.firstDate.printDate(),
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
                      IconData(0xe55b, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 30,
                      semanticLabel: 'Time',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.palestra.firstDate.printTime() +
                          " - " +
                          this.palestra.secondDate.printTime(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ],
                )),
              ],
            ),
            height: 150,
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: 20)),
        SizedBox(
          height: 30,
        )
      ],
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
            Container(
              child: IconButton(
                color: Colors.white,
                icon: Icon(IconData(61562, fontFamily: 'MaterialIcons')),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainPage(this.user, this.database)),
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
          getPalestraInfo(),
          getSeats(),
          cancelButton(),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
