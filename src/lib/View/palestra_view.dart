import 'package:flutter/material.dart';
import '../Model/palestra.dart';
import '../Model/user.dart';
import '../Controller/reservation_page.dart';
import '../Controller/reserved.dart';
import '../database.dart';

class PalestraView extends StatelessWidget {
  final Palestra _palestra;
  final User _user;
  final int _index;
  final Database _database;

  PalestraView(this._palestra, this._user, this._index, this._database);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
              child: Column(
                children: <Widget>[
                  // Name
                  Container(
                    child: Text(
                      this._palestra.name,
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
                          this._palestra.location,
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
                          this._palestra.firstDate.printDate(),
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
                        this._palestra.firstDate.printTime() +
                            " - " +
                            this._palestra.secondDate.printTime(),
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
                          color: this._palestra.isFull(),
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
          onTap: () {
            if (this._index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ReservationPage(
                        this._palestra, this._user, this._database)),
              );
            } else if (this._index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ReservedPage(
                        this._palestra, this._user, this._database)),
              );
            }
          },
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
