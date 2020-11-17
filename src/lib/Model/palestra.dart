import 'package:flutter/material.dart';
import 'date.dart';

class Palestra {
  final String name;
  final Date firstDate;
  final Date secondDate;
  final String location;
  final bool full;

  Palestra(
      this.name, this.firstDate, this.secondDate, this.location, this.full);

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
}
