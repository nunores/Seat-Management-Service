import 'Model/date.dart';
import 'Model/palestra.dart';
import 'Model/user.dart';

class Database {
  final List<Palestra> palestras = [
    new Palestra("Palestra #1", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", true),
    new Palestra("Palestra #2", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", true),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
  ];

  final List<User> users = [
    new User("abc", "123", false),
    new User("nuno", "talas", false),
    new User("calves", "quebra", false),
    new User("antonio", "pipoca", false),
    new User("admin", "admin", true),
    new User("1Pedra", "1/2Quebra", false)
  ];

  void addUser(User user) {
    users.add(user);
  }

  void addPalestra(Palestra palestra){
    print(palestra);
    palestras.add(palestra);
  }

  List<Palestra> removePalestras(String text, User user) {
    List<Palestra> palestrasTemp = new List<Palestra>.from(palestras);
    int palestrasSize = palestrasTemp.length;
    if (text != "" || user.palestrasGoing.isNotEmpty) {
      for (var i = palestrasSize - 1; i >= 0; i--) {
        if (!palestrasTemp[i].getSearchResult().contains(text) ||
            user.isGoing(palestrasTemp[i])) {
          palestrasTemp.remove(palestrasTemp[i]);
        }
      }
    }
    return palestrasTemp;
  }

  List<Palestra> getPalestras(String text, User user) {
    return removePalestras(text, user);
  }

  List<User> getUsers() {
    return users;
  }

  List<Palestra> getReserved(User user) {
    for (var i = 0; i < users.length; i++) {
      if (users[i] == user) {
        return users[i].getPalestrasGoing();
      }
    }
    return null;
  }
}
