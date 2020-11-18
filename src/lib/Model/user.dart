import 'palestra.dart';

class User {
  final String username;
  final String password;

  final List<Palestra> palestrasGoing = [];

  User(this.username, this.password);

  addPalestra(Palestra palestra) {
    this.palestrasGoing.add(palestra);
  }
}
