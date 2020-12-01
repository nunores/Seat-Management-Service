import 'palestra.dart';

class User {
  final String username;
  final String password;
  final bool admin;

  final List<Palestra> palestrasGoing = [];

  User(this.username, this.password, this.admin);

  void addPalestraGoing(Palestra palestra) {
    this.palestrasGoing.add(palestra);
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
}
