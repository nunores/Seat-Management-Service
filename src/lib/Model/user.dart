import 'palestra.dart';

class User {
  final String username;
  final String password;

  final List<Palestra> palestrasGoing = [];

  User(this.username, this.password);

  void addPalestraGoing(Palestra palestra) {
    this.palestrasGoing.add(palestra);
  }

  bool isGoing(Palestra palestra) {
    return palestrasGoing.contains(palestra);
  }
}
