import 'package:flutter/material.dart';
import 'date.dart';

class Palestra {
  final String name;
  final Date firstDate;
  final Date secondDate;
  final String location;
  final bool full;
  final List<int> seats;

  Palestra(this.name, this.firstDate, this.secondDate, this.location, this.full,
      this.seats);

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

  bool getIsFull() {
    return full;
  }
  String getName() {
    return name;
  }

  Color isFull() {
    if (this.full) {
      return Colors.red[300];
    }
    return Colors.green[300];
  }

  List<int> getSeats() {
    return seats;
  }
}

