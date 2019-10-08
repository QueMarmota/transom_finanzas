import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//Variables for dropdrown Entities list
String _currentEntity;
const List _entities = [
  '',
  'San Luis Potosí',
  'Durango',
  'Chihuahua',
  'Michoacán',
  'Sinaloa',
  'Campeche',
  'Quintana Roo',
  'Yucatán',
  'Puebla',
  'Guanajuato',
  'Nayarit',
  'Tabasco',
  'Estado de México',
  'Hidalgo',
  'Querétaro',
  'Colima',
  'Morelos',
];
List<DropdownMenuItem<String>> _dropDownMenuItemsEntities;

double _fontSize;
double _heightButtons;
EdgeInsets _paddingTextField;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//variable for the form
final _formKey = GlobalKey<FormState>();

class SearchCurpByName extends StatefulWidget {
  SearchCurpByName({Key key}) : super(key: key);

  _SearchCurpByNameState createState() => _SearchCurpByNameState();
}

class _SearchCurpByNameState extends State<SearchCurpByName> {
  //radio button variables
  var _selectedRadio = 0;
  //date for date of birth
  var _date = '';
//form variables
  var name = TextEditingController();
  var firstLastName = TextEditingController();
  var seccondLastName = TextEditingController();

  @override
  void initState() {
    name = TextEditingController();
    //Initialize dropdown list
    // here we are creating the list needed for the DropDownButton
    List<DropdownMenuItem<String>> getDropDownMenuItemsEntities() {
      List<DropdownMenuItem<String>> items = new List();
      for (String categorie in _entities) {
        // here we are creating the drop down menu items, you can customize the item right here
        // but I'll just use a simple text for this
        items.add(
            new DropdownMenuItem(value: categorie, child: new Text(categorie)));
      }
      return items;
    }

    //get the values of the list
    _dropDownMenuItemsEntities = getDropDownMenuItemsEntities();
    //change the current categorie from the reloaded list
    _currentEntity = _dropDownMenuItemsEntities[0].value;
    //end of variables need it
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
                      formTextBoxName(context),
                      formTextBoxFirstLastName(context),
                      formTextBoxSeccondLastName(context),
                      entityDropDownList(context),
                      datePicker(context),
                      radioButtonGender(context),
                      buttonSearchCurpByName(context),
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
                      formTextBoxName(context),
                      formTextBoxFirstLastName(context),
                      formTextBoxSeccondLastName(context),
                      entityDropDownList(context),
                      datePicker(context),
                      radioButtonGender(context),
                      buttonSearchCurpByName(context)
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      formTextBoxName(context),
                      formTextBoxFirstLastName(context),
                      formTextBoxSeccondLastName(context),
                      entityDropDownList(context),
                      datePicker(context),
                      radioButtonGender(context),
                      buttonSearchCurpByName(context),
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

  Widget buttonSearchCurpByName(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonTheme(
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

  Widget formTextBoxName(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nombre',
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
                    hintText: '',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Gotham_book',
                        fontSize: _fontSize))),
          ),
        ],
      ),
    );
  }

  Widget formTextBoxFirstLastName(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Primer Apellido',
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
                controller: firstLastName,
                validator: (firstLastName) {
                  if (firstLastName == "") return 'Falta llenar campo';
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
                    hintText: '',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Gotham_book',
                        fontSize: _fontSize))),
          ),
        ],
      ),
    );
  }

  Widget formTextBoxSeccondLastName(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Segundo Apellido',
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
                controller: seccondLastName,
                validator: (seccondLastName) {
                  if (seccondLastName == "") return 'Falta llenar campo';
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
                    hintText: '',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Gotham_book',
                        fontSize: _fontSize))),
          ),
        ],
      ),
    );
  }

  static String translateMoth(String _month) {
    switch (int.parse(_month)) {
      case 1:
        return "Enero";
        break;
      case 2:
        return "Febrero";
        break;
      case 3:
        return "Marzo";
        break;
      case 4:
        return "Abril";
        break;
      case 5:
        return "Mayo";
        break;
      case 6:
        return "Junio";
        break;
      case 7:
        return "Julio";
        break;
      case 8:
        return "Agosto";
        break;
      case 9:
        return "Septiembre";
        break;
      case 10:
        return "Octubre";
        break;
      case 11:
        return "Noviembre";
        break;
      case 12:
        return "Diciembre";
        break;

      default:
        return "";
        break;
    }
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      _selectedRadio = val;
    });
  }

  Widget radioButtonGender(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Text(
            'Sexo',
            style: TextStyle(
              color: Colors.blue,
              fontSize: _fontSize,
              fontFamily: '',
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _selectedRadio,
                activeColor: Colors.blue,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              new Text(
                'Masculino',
                style: new TextStyle(fontSize: _fontSize),
              ),
              Radio(
                value: 2,
                groupValue: _selectedRadio,
                activeColor: Colors.pink,
                onChanged: (val) {
                  setSelectedRadio(val);
                },
              ),
              new Text(
                'Femenino',
                style: new TextStyle(
                  fontSize: _fontSize,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget datePicker(BuildContext context) {
    return //date
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Fecha de nacimiento',
            style: TextStyle(color: Colors.blue, fontSize: _fontSize),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 15,
          // color: Colors.red,
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.blue, width: 2.0),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          alignment: Alignment.centerLeft,
          child: FlatButton(
            onPressed: () {
              DatePicker.showDatePicker(context, onChanged: (date) {},
                  onConfirm: (date) {
                int datePlus1Hour =
                    DateTime.now().millisecondsSinceEpoch + 360000;

                // dateForServerPost = date;
                setState(() {
                  _date =
                      ('${date.day.toString()} ${translateMoth(date.month.toString())} ${date.year.toString()}');
                });
              }, currentTime: DateTime.now(), locale: LocaleType.es);
            },
            child: Container(
              margin: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_date,
                        style:
                            TextStyle(color: Colors.blue, fontSize: _fontSize)),
                  ),
                  Container(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget entityDropDownList(BuildContext context) {
    //change the current entity selected
    changeCurrentEntity(String value) {
      setState(() {
        _currentEntity = value;
      });
    }

    return new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selecciona Entidad',
                style: TextStyle(color: Colors.blue, fontSize: _fontSize),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(0),
                child: new DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: _fontSize,
                  ),
                  iconSize: 30,
                  isExpanded: true,
                  // isDense: true,
                  value: _currentEntity,
                  iconEnabledColor: Colors.blue,
                  items: _dropDownMenuItemsEntities,
                  onChanged: changeCurrentEntity,
                )),
          ],
        ));
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
        title: Text('Buscar por nombre'),
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
              _fontSize = 15;
              _heightButtons = 30;
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
