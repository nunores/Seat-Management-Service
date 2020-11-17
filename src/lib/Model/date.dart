class Date {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int min;

  Date(this.year, this.month, this.day, this.hour, this.min);

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
