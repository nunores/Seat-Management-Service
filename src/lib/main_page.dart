import 'package:flutter/material.dart';
//import 'main.dart';

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

  String getSearchResult() {
    return this.name +
        " " +
        this.location +
        " " +
        this.name +
        " " +
        this.name.toLowerCase() +
        " " +
        this.location.toLowerCase() +
        " " +
        this.name.toLowerCase();
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
  String search;

  MainPage(String search) {
    this.search = search;
  }

  @override
  Widget build(BuildContext context) {
    var palestras = List<Palestra>();
    var palestra1 = new Palestra("Palestra #1", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false);
    var palestra2 = new Palestra("Palestra #2", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false);
    var palestra3 = new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false);

    palestras.add(palestra1);
    palestras.add(palestra2);
    palestras.add(palestra1);
    palestras.add(palestra2);
    palestras.add(palestra1);
    palestras.add(palestra2);
    palestras.add(palestra1);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra2);
    palestras.add(palestra3);
    palestras.add(palestra3);
    palestras.add(palestra3);
    palestras.add(palestra3);

    int palestrasSize = palestras.length;

    if (this.search != "") {
      for (var i = palestrasSize - 1; i >= 0; i--) {
        if (!palestras[i].getSearchResult().contains(search)) {
          palestras.remove(palestras[i]);
        }
      }
    }

    final _searchBarController = TextEditingController();

/*     void dispose() {
      _searchBarController.dispose();
      super.dispose();
    } */


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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search...',
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
                    controller: _searchBarController,
                    onSubmitted: (_searchBarController) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainPage(_searchBarController)),
                      );
                    },
                  ),
                  height: 50,
                  width: 350,
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      IconData(59828, fontFamily: 'MaterialIcons'),
                      size: 40,
                    ),
                    color: Colors.white,
                    tooltip: 'Search',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainPage(_searchBarController.text)),
                      );
                    },
                  ),
                  margin: EdgeInsets.all(1),
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 20, right: 1),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: palestras.map((palestra) => palestra.draw()).toList(),
          )
        ],
      ),
    );
  }
}

/*Seat: IconData(59147, fontFamily: 'MaterialIcons')*/
/*List: IconData(59171, fontFamily: 'MaterialIcons', matchTextDirection: true)*/
