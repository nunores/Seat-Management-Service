import 'palestra.dart';

class User {
  final String username;
  final String password;
  final bool admin;

  final List<Palestra> palestrasGoing = [];

  final List<int> seatsReserved = [];

  User(this.username, this.password, this.admin);

  void addPalestraGoing(Palestra palestra) {
    this.palestrasGoing.add(palestra);
  }

  void addSeat(int seat) {
    this.seatsReserved.add(seat);
  }

  bool isGoing(Palestra palestra) {
    return palestrasGoing.contains(palestra);
  }

  String getUser() {
    return this.username;
  }

  String getPass() {
    return this.password;
  }

  bool isAdmin() {
    return this.admin;
  }

  List<Palestra> getPalestrasGoing() {
    return palestrasGoing;
  }

  List<int> getSeatsReserved() {
    return seatsReserved;
  }

  int getIndexPalestra(Palestra palestra) {
    for (int i = 0; i < palestrasGoing.length; i++) {
      if (palestrasGoing[i] == palestra) return i;
    }

    return -1;
  }
}
