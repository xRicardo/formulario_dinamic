import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'header_widget.dart';
import 'switch.dart';

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
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.32;
    return Card(
      color: Colors.transparent,
      child: Scaffold(
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
                        CajaDate(),
                        const SizedBox(
                          height: 20,
                        ),
                        Header(title: 'Sex'),
                        switchFemale(),
                        button(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    padding: const EdgeInsets.all(142.0),
    child: Column(
      children: <Widget>[
        Text(
          'Lacey Fernandez',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
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

Widget switchFemale() {
  return SwitchListTile(
    value: true,
    title: Text(
      'Female',
      style: TextStyle(
        fontSize: 14,
      ),
    ),
    onChanged: (val) {},
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
                Icons.mobile_friendly_rounded,
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

class CajaDate extends StatefulWidget {
  @override
  _CajaDateState createState() => _CajaDateState();
}

class _CajaDateState extends State<CajaDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.calendar_today,
                color: DeliveryColors.purple,
              ),
              labelText: 'DD / MM / YYYY',
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
