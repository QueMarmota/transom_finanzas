import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//radio button variables
var _selectedRadio = 0;
//form variables
var name = TextEditingController();
var firstLastName = TextEditingController();
var seccondLastName = TextEditingController();
var _fecha = '';
var phone = TextEditingController();
var email = TextEditingController();
var password = TextEditingController();
var password2 = TextEditingController();

double _fontSize;
double _heightButtons;
EdgeInsets _paddingTextField;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//variable for the form
final _formKey = GlobalKey<FormState>();

class SearchCurp extends StatefulWidget {
  SearchCurp({Key key}) : super(key: key);

  _SearchCurpState createState() => _SearchCurpState();
}

class _SearchCurpState extends State<SearchCurp> {
  @override
  void initState() {
    email = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    super.initState();
  }

  //Functions size screen responsive
  Widget sizeScreen480x640(BuildContext context) {
    return Stack(
      children: <Widget>[
        // backgroundImage(context),
        SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 30, 20, 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 5,
              //   alignment: Alignment.topCenter,
              //   child: Image.asset(
              //     'images/bucket_logo.png',
              //   ),
              // ),
              Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      formTextBoxCurp(context),

                      buttonSearchCurp(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget sizeScreen720x1280(BuildContext context) {
    return Stack(
      children: <Widget>[
        // backgroundImage(context),
        SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 4.5,
              //   alignment: Alignment.topCenter,
              //   child: Image.asset(
              //     'images/bucket_logo.png',
              //   ),
              // ),
              Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      formTextBoxCurp(context),
     
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        child: buttonSearchCurp(context),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget sizeScreen1200x1920(BuildContext context) {
    return Stack(
      children: <Widget>[
        // backgroundImage(context),
        SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 30, 20, 1),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 4.5,
              //   alignment: Alignment.topCenter,
              //   child: Image.asset(
              //     'images/bucket_logo.png',
              //   ),
              // ),
              Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      formTextBoxCurp(context),
     
                      buttonSearchCurp(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isButtonTapped = false;
  //function called when sign in button its hited
  _onTapped() {
    if (_formKey.currentState.validate()) {
      setState(() => _isButtonTapped =
          !_isButtonTapped); //tapping the button once, disables the button from being tapped again
      // signInHttpPetition();
    }
  }

  // signInHttpPetition() async {
  //   // await Future.delayed(Duration(milliseconds: 1000));

  //   // Navigator.pushReplacement(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) => Login(),
  //   //     ));

  //   // Dialogs dialog = new Dialogs();
  //   var url = globals.apiUrl + 'users/signin';
  //   var response = await http.post(url, body: {
  //     'email': '${email.text}',
  //     'name': '${name.text}',
  //     'phone': '${phone.text == "" ? '' : phone.text}',
  //     'password': '${password.text}'
  //   });

  //   //Decode json
  //   Map<String, dynamic> data = jsonDecode(' ${response.body}');
  //   if ('${data['status']}' == "success") {
  //     //if everything works fine in server side
  //     // dialog.success(context, 'Registro Correcto',
  //     //     '¡Te enviamos un\ncorreo para\nactivar la cuenta!');
  //     // await Future.delayed(Duration(seconds: 3));
  //     // Navigator.of(context, rootNavigator: true).pop('dialog');
  //     // await Future.delayed(Duration(milliseconds: 500));

  //     _scaffoldKey.currentState.showSnackBar(SnackBar(
  //       content: Text(
  //         'Registrado',
  //         style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
  //       ),
  //       duration: Duration(seconds: 1),
  //     ));

  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Login(),
  //         ));
  //   } else {
  //     //if http petition goes wrong
  //     // dialog.error(context, 'Algo salio mal', 'Intentalo mas tarde');
  //     // await Future.delayed(Duration(seconds: 2));
  //     // Navigator.of(context, rootNavigator: true).pop('dialog');
  //   }
  // }

  Widget buttonSearchCurp(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          ButtonTheme(
            height: 40,
            minWidth: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
              onPressed: _isButtonTapped ? null : _onTapped,
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: new BorderRadius.circular(10.0)),
              child: new Text(
                'Buscar',
                style: new TextStyle(
                  fontFamily: "Gotham_Book",
                  fontSize: _fontSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Text(
          //   '*Campos obligatorios',
          //   style: TextStyle(
          //       color: Colors.grey,
          //       fontFamily: 'Gotham_book',
          //       fontSize: _fontSize - 3),
          // ),
        ],
      ),
    );
  }

  Widget backgroundImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.grey.withOpacity(0.25), BlendMode.dstOut),
          image: ExactAssetImage('assets/images/bg5.jpg'),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget formTextBoxCurp(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'CURP',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: _fontSize,
                  fontFamily: 'Gotham_book'),
            ),
          ),
          Container(
            child: new TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gotham_book',
                    fontSize: _fontSize),
                controller: name,
                validator: (name) {
                  if (name == "") return 'Falta llenar campo';
                },
                decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: _fontSize - 2),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: _paddingTextField,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                    alignLabelWithHint: true,
                    hintText: 'Escribe tu CURP',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Gotham_book',
                        fontSize: _fontSize))),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //disable screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buscar por CURP'),
        backgroundColor: Colors.blue,
      ),
      body: Theme(
        data: ThemeData(accentColor: Colors.blue, fontFamily: 'Roboto'),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.height < 379) {
              //480x640
              _fontSize = 13;
              _heightButtons = 30;
              _paddingTextField = EdgeInsets.fromLTRB(10, 5, 10, 10);
              return sizeScreen480x640(context);
            } else if (MediaQuery.of(context).size.height < 650) {
              //720x1280
              _fontSize = 16;
              _heightButtons = 35;
              _paddingTextField = EdgeInsets.fromLTRB(10, 10, 10, 10);
              return sizeScreen720x1280(context);
            } else {
              _fontSize = 20;
              _heightButtons = 40;
              _paddingTextField = EdgeInsets.fromLTRB(10, 10, 10, 10);
              return sizeScreen1200x1920(context);
            }
          },
        ),
      ),
    );
  }
}
