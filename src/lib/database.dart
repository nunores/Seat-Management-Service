import 'Model/date.dart';
import 'Model/palestra.dart';
import 'Model/user.dart';

class Database {
  List<Palestra> palestras;

  Database() {
    palestras = [
      new Palestra(
          "3-D Digital Imaging and Modelling",
          new Date(2020, 12, 23, 12, 30),
          new Date(2020, 12, 23, 14, 30),
          "Montreal",
          false,
          generateSeats()),
      new Palestra(
          "A Satellite workshop on Formal Approaches to Testing of Software",
          new Date(2020, 12, 24, 17, 00),
          new Date(2020, 12, 24, 19, 00),
          "Vancouver",
          false,
          generateSeats()),
      new Palestra(
          "AAAI International Conference on Weblogs and Social Media",
          new Date(2021, 3, 1, 13, 30),
          new Date(2021, 3, 1, 17, 00),
          "Nashville",
          false,
          generateSeats()),
      new Palestra(
          "Abstract State Machines Alloy B and Z",
          new Date(2021, 3, 15, 09, 30),
          new Date(2021, 3, 15, 11, 30),
          "Xi'an",
          false,
          generateSeats()),
      new Palestra(
          "ACIS International Conference on Software Engineering Research Management and Applications",
          new Date(2021, 3, 29, 18, 30),
          new Date(2021, 3, 29, 20, 30),
          "Vienna",
          false,
          generateSeats()),
      new Palestra(
          "ACM Conference on Applications, Technologies, Architectures, and Protocols for Computer Communication",
          new Date(2021, 3, 30, 19, 45),
          new Date(2021, 3, 30, 21, 30),
          "Yokohama",
          false,
          generateSeatsFull()),
      new Palestra(
          "Accelerating excellence in the built environment World Conference",
          new Date(2021, 4, 15, 12, 30),
          new Date(2021, 4, 15, 14, 30),
          "Singapore",
          false,
          generateSeatsAlmostFull()),
    ];
  }

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

  void addPalestra(Palestra palestra) {
    print(palestra);
    palestras.add(palestra);
  }

  void editPalestra(Palestra palestra, String name, Date firstDate,
      Date secondDate, String location) {
    palestra.setName(name);
    palestra.setLocation(location);
    palestra.setFisrtDate(firstDate);
    palestra.setSecondDate(secondDate);
  }

  void removePalestra(Palestra palestra) {
    palestras.remove(palestra);
  }

  List<Palestra> removePalestras(String text, User user) {
    List<Palestra> palestrasTemp = new List<Palestra>.from(palestras);
    int palestrasSize = palestrasTemp.length;
    if (text != "" || user.palestrasGoing.isNotEmpty) {
      for (var i = palestrasSize - 1; i >= 0; i--) {
        if (!palestrasTemp[i].getSearchResult().contains(
                text) /*  ||
            user.isGoing(palestrasTemp[i]) */
            ) {
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

  List<int> generateSeats() {
    List<int> result = new List<int>();
    result = [
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
      0,
      -1,
    ];

    return result;
  }

  List<int> generateSeatsFull() {
    List<int> result = new List<int>();
    result = [
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
    ];

    return result;
  }

  List<int> generateSeatsAlmostFull() {
    List<int> result = new List<int>();
    result = [
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      1,
      -1,
      0,
      -1,
    ];

    return result;
  }
}
