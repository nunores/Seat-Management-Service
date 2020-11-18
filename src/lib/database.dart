import 'Model/date.dart';
import 'Model/palestra.dart';
import 'Model/user.dart';

class Database {
  final List<Palestra> palestras = [
    new Palestra("Palestra #1", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false),
    new Palestra("Palestra #2", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Viseu", false),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
    new Palestra("Palestra #3", new Date(2000, 12, 2, 12, 30),
        new Date(2000, 12, 2, 14, 30), "Porto", false),
  ];

  List<Palestra> removePalestras(String text, User user) {
    List<Palestra> palestrasTemp = new List<Palestra>.from(palestras);
    int palestrasSize = palestrasTemp.length;
    if (text != "") {
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
}
