import 'package:flutter/material.dart';
import 'package:gestionuser/AI/camera.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center, // use aligment
                color: Color.fromRGBO(0, 96, 91, 1.0),
                width: double.infinity,
                height: size.height,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: size.width * 0.05,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      width: size.width * 0.14,
                    ),
                  ),
                  SizedBox(height: size.height * 0.15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Cam()));
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Cam()),
                      //     (route) => false);
                    },
                    child: Image.asset(
                        'assets/images/kisspng-commonwealth-bank-cheque-credit-card-logo-mind-your-own-mind-5ade9fe3aea6e6.8384758115245393637154.png',
                        height: 350,
                        width: 300,
                        fit: BoxFit.cover),
                  )
                ]))));

    // backgroundColor: Color(0xffDEF4EC), body: SingleChildScrollView()); login_bottom.png
  }
}
