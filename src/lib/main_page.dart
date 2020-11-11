import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class Palestra {
  String name;
  Date firstDate;
  Date secondDate;
  String location;
  bool full;

  // Constructor
  Palestra(String name, Date firstDate, Date secondDate, String location,
      bool full) {
    this.name = name;
    this.firstDate = firstDate;
    this.secondDate = secondDate;
    this.location = location;
    this.full = full;
  }

  Color isFull() {
    if (this.full) {
      return Colors.red[600];
    }
    return Colors.green[700];
  }

  Widget draw() {
    return Column(
      children: [
        Container(
            child: Column(
              children: <Widget>[
                // Name
                Container(
                  child: Text(
                    this.name,
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
                        this.location,
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
                        this.firstDate.printDate(),
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
                      this.firstDate.printTime() +
                          " - " +
                          this.secondDate.printTime(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ],
                )),
                Row(
                  children: [
                    SizedBox(
                      width: 330,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        color: this.isFull(),
                        shape: CircleBorder(),
                      ),
                      width: 15,
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF98C1D9),
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(30),
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
}

class Date {
  int year;
  int month;
  int day;
  int hour;
  int min;

  Date(int year, int month, int day, int hour, int min) {
    this.year = year;
    this.month = month;
    this.day = day;
    this.hour = hour;
    this.min = min;
  }

  printDate() {
    return this.day.toString() +
        "/" +
        this.month.toString() +
        "/" +
        this.year.toString();
  }

  printTime() {
    return this.hour.toString() + ":" + this.min.toString();
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var palestras = List<Palestra>();
    var palestra1 = new Palestra("Palestra #1", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false);
    var palestra2 = new Palestra("Palestra #2", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false);

    palestras.add(palestra1);
    palestras.add(palestra2);

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
                  height: 40,
                ),
                margin: EdgeInsets.only(left: 10),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF98C1D9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.fromHeight(100), // Placeholder for search bar
            ),
            Column(
              children: palestras.map((palestra) => palestra.draw()).toList(),
            )
          ],
        ));
  }
}
