import 'package:flutter/material.dart';
import './SearchCurpByName.dart';
import './SearchCurp.dart';

var nameEvent = TextEditingController();
double _fontSize = 18;
Color _inputColor;
Color _fontColor = Colors.white;
double _buttonSize;
EdgeInsets _paddingInput;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Secretaría de finanzas'),
                backgroundColor: Colors.blue,
              ),
              body: Stack(
                children: <Widget>[
                  SafeArea(
                      left: true,
                      top: true,
                      right: true,
                      bottom: false,
                      minimum: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // formTextBoxNameEvent(context),
                                // categorieDropDownList(context),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              //DRAWER CODE
              drawer: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: ExactAssetImage('assets/images/sec_fin.jpg'),
                          fit: BoxFit.fitWidth,
                        )),
                      ),
                    ),
                    ExpansionTile(
                      title: Text("CURP"),
                      children: <Widget>[
                        ListTile(
                          title: Text('Buscar por CURP'),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      (SearchCurp()),
                                ));
                          },
                        ),
                        ListTile(
                          title: Text('Buscar por nombre'),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      (SearchCurpByName()),
                                ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
