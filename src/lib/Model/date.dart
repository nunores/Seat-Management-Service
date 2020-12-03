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
    var minutes;

    if(this.min < 10)
      minutes = "0" + this.min.toString();
    else minutes = this.min.toString();

    return this.hour.toString() + ":" + minutes ;

  }
}
