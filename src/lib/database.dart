import 'Model/date.dart';
import 'Model/palestra.dart';

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

  List<Palestra> removePalestras(String text) {
    List<Palestra> palestrasTemp = new List<Palestra>.from(palestras);
    int palestrasSize = palestrasTemp.length;
    if (text != "") {
      for (var i = palestrasSize - 1; i >= 0; i--) {
        if (!palestrasTemp[i].getSearchResult().contains(text)) {
          palestrasTemp.remove(palestrasTemp[i]);
        }
      }
    }
    return palestrasTemp;
  }

  List<Palestra> getPalestras(String text) {
    return removePalestras(text);
  }
}
