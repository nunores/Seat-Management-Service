import 'package:flutter/material.dart';
import 'date.dart';

class Palestra {
  String name;
  Date firstDate;
  Date secondDate;
  String location;
  final bool full;
  final List<int> seats;

  Palestra(this.name, this.firstDate, this.secondDate, this.location, this.full,
      this.seats);

  void setName(String name) {
    this.name = name;
  }

  void setFisrtDate(Date date) {
    this.firstDate = date;
  }

  void setSecondDate(Date date) {
    this.secondDate = date;
  }

  void setLocation(String location) {
    this.location = location;
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

  bool getIsFull() {
    return !this.seats.contains(0);
  }

  String getName() {
    return name;
  }

  Color isFull() {
    if (!this.seats.contains(0)) {
      return Colors.red[300];
    }
    return Colors.green[300];
  }

  List<int> getSeats() {
    return seats;
  }
}
