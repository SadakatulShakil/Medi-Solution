import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'HomeScreen.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    print("running splash");
    startTimer();
    super.initState();
  }

  startTimer() async{
    var duration = Duration(seconds: 5);
    return new Timer(duration, homePageRoute);
  }

  homePageRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomeScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Container(
              margin:  EdgeInsets.only(bottom: 130.0),
              child: Image.asset("assets/icons/splash_icon.png", width: 200, height: 200),
            ),
          ),
          Center(
            child: Container(
              margin:  const EdgeInsets.only(top: 130.0),
              child: Image.asset("assets/icons/icon.png", width: 350, height: 300),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: JumpingDotsProgressIndicator(
                    fontSize: 50.0,
                    numberOfDots: 5,
                    color: new Color(0xFF00A6FF),
                    milliseconds: 120,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
