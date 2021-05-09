import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'header_widget.dart';

void main() => runApp(MainFlightApp());

class MainFlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: FlightHomeApp(),
    );
  }
}

class FlightHomeApp extends StatefulWidget {
  @override
  _FlightHomeAppState createState() => _FlightHomeAppState();
}

class _FlightHomeAppState extends State<FlightHomeApp> {
  bool _check = false;
  String _fecha = '';
  //esta propiedad me va a servir para llenar la caja de texto con lo que tenga en _fecha
  TextEditingController _inputFieldDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.32;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            height: headerHeight,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.pinkAccent,
                    Colors.purple,
                  ],
                  stops: [0.2, 0.6],
                ),
              ),
            ),
          ),
          img(),
          texto(),
          Positioned(
            left: 10,
            right: 10,
            top: headerHeight / 1.2,
            bottom: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderWidget(title: 'USER PROFILE'),
                      Header(title: 'User Name'),
                      CajaUser(),
                      const SizedBox(
                        height: 20,
                      ),
                      Header(title: 'Email Id'),
                      CajaEmail(),
                      const SizedBox(
                        height: 20,
                      ),
                      Header(title: 'Mobile Number'),
                      CajaMobile(),
                      const SizedBox(
                        height: 20,
                      ),
                      Header(title: 'Date of Birth'),
                      CajaFecha(),
                      const SizedBox(
                        height: 20,
                      ),
                      Header(title: 'Sex'),
                      _crearSwitchF(),
                      _crearSwitchM(),
                      button(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _crearSwitchF() => SwitchListTile(
        title: Text('Female'),
        controlAffinity: ListTileControlAffinity.leading,
        value: _check,
        onChanged: (valor) {
          setState(() {
            _check = valor;
          });
        },
      );
  _crearSwitchM() => SwitchListTile(
        title: Text('Male'),
        controlAffinity: ListTileControlAffinity.leading,
        value: _check,
        onChanged: (valor) {
          setState(() {
            _check = valor;
          });
        },
      );

  void changeSwitch() {
    setState(() {
      _check = _check == _crearSwitchM() ? _crearSwitchM() : _crearSwitchF();
    });
  }
}

class CajaFecha extends StatefulWidget {
  const CajaFecha({
    Key key,
  }) : super(key: key);

  @override
  _CajaFechaState createState() => _CajaFechaState();
}

class _CajaFechaState extends State<CajaFecha> {
  String date = "";
  TextEditingController _txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _txtController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.calendar_today,
          color: DeliveryColors.purple,
        ),
        labelText: 'DD / MM / YYYY',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDAte(context);
      },
      // onChanged: (valor) {
      //   date = valor;
      //   setState(() {
      //     _selectDAte(context);
      //   });
      // },
    );
  }

  void _selectDAte(BuildContext context) async {
    DateTime dateP = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
      initialDate: DateTime.now(),
    );
    if (dateP != null) {
      setState(() {});
      date = dateP.toString();
      _txtController.text = date;
    }
  }
}

Widget img() {
  return Padding(
    padding: const EdgeInsets.all(50.0),
    child: Container(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 3,
              color: Color(0xFF8E44AD),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/c6/a1/24/c6a1246becbdf914d435353cfa640da5.jpg'),
                      height: 95,
                      width: 95,
                      fit: BoxFit.cover),
                ),
              ),
              icono(),
            ],
          ),
        ),
      ],
    )),
  );
}

Widget texto() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 133, vertical: 159),
    child: Column(
      children: <Widget>[
        Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Panda",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          iconEditar(),
        ]),
      ],
    ),
  );
}

Widget icono() {
  return Positioned(
    right: 0,
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        child: Icon(
          Icons.add,
          color: Colors.purple,
        ),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      onPressed: () {},
    ),
  );
}

Widget button() {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: deliveryGradients,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
        child: Text(
          'SAVE',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget iconEditar() {
  return Positioned(
    right: 0,
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        child: Icon(
          Icons.edit,
          color: Colors.purple,
        ),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 0,
          ),
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      onPressed: () {},
    ),
  );
}

class CajaUser extends StatefulWidget {
  @override
  _CajaUserState createState() => _CajaUserState();
}

class _CajaUserState extends State<CajaUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline,
                color: DeliveryColors.purple,
              ),
              labelText: 'Enter User Name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          onChanged: (valor) {
            setState(() {});
          },
        ),
      ),
    );
  }
}

class CajaEmail extends StatefulWidget {
  @override
  _CajaEmailState createState() => _CajaEmailState();
}

class _CajaEmailState extends State<CajaEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: DeliveryColors.purple,
            ),
            labelText: 'Enter Email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onChanged: (valor) {
            setState(() {});
          },
        ),
      ),
    );
  }
}

class CajaMobile extends StatefulWidget {
  @override
  _CajaMobileState createState() => _CajaMobileState();
}

class _CajaMobileState extends State<CajaMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android,
                color: DeliveryColors.purple,
              ),
              labelText: 'Enter your 10 digit mobile number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          onChanged: (valor) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
