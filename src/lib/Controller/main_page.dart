import 'package:flutter/material.dart';
import '../View/palestra_view.dart';
import '../database.dart';
import '../Model/user.dart';
import '../main.dart';

enum ProfileOptions { logout }

class MainPage extends StatelessWidget {
  static const String _title = 'Main Page';

  final User user;
  final Database database;

  MainPage(this.user, this.database);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(this.user, this.database),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final User user;
  final Database database;

  MyStatefulWidget(this.user, this.database, {Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() =>
      _MyStatefulWidgetState(this.user, this.database);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String text;
  Database database;
  User user;

  _MyStatefulWidgetState(this.user, this.database, {this.text = ""});

  int _selectedIndex = 0;

  final _searchBarController = TextEditingController();

  Container getSearchBar() {
    return Container(
      child: Row(
        children: [
          Container(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Ex: Palestra 1 / Porto',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(150)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(150)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              controller: this._searchBarController,
              onSubmitted: (_searchBarController) {
                this.text = this._searchBarController.text;
                setState(() {
                  user = this.user;
                  this._searchBarController.text;
                });
              },
            ),
            height: 50,
            width: 300,
          ),
          Container(
            child: IconButton(
              icon: Icon(
                const IconData(59828, fontFamily: 'MaterialIcons'),
                size: 40,
              ),
              color: Colors.white,
              tooltip: 'Search',
              onPressed: () {
                this.text = this._searchBarController.text;
                setState(() {
                  user = this.user;
                  this._searchBarController.text;
                });
              },
            ),
            margin: EdgeInsets.all(1),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20, right: 1),
    );
  }

  List<Widget> getWidgetOptions() {
    return <Widget>[
      ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          getSearchBar(),
          SizedBox(
            height: 30,
          ),
          Column(
            children: database
                .getPalestras(this.text, this.user)
                .map((palestra) => new PalestraView(
                        palestra, this.user, this._selectedIndex, this.database)
                    .build(context))
                .toList(),
          )
        ],
      ),
      ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: database
                .getReserved(this.user)
                .map((palestra) => new PalestraView(
                        palestra, this.user, this._selectedIndex, this.database)
                    .build(context))
                .toList(),
          )
        ],
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293241),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 55,
              ),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
        actions: [
          Container(
            child: PopupMenuButton(
              onSelected: (ProfileOptions result) {
                setState(() {
                  if (result == ProfileOptions.logout) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  database: this.database,
                                )));
                  }
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ProfileOptions>>[
                const PopupMenuItem<ProfileOptions>(
                  value: ProfileOptions.logout,
                  child: Text('Log Out'),
                ),
              ],
              icon: Icon(
                const IconData(59648, fontFamily: 'MaterialIcons'),
                size: 50,
                color: Colors.white,
              ),
            ),
            margin: EdgeInsets.only(right: 20),
          )
        ],
      ),
      backgroundColor: Color(0xFF98C1D9),
      body: Center(
        child: getWidgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              const IconData(59147, fontFamily: 'MaterialIcons'),
            ),
            label: 'All Conferences',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              const IconData(59171,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
            ),
            label: 'My Conferences',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFEE6C4D),
        onTap: _onItemTapped,
      ),
    );
  }
}
