import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Screens/MobileVerificationScreen.dart';

import '../language/Languages.dart';

class DoctorRegistrationScreen extends StatefulWidget{
  @override
  _DoctorRegistrationScreenState createState() => _DoctorRegistrationScreenState();

}
class _DoctorRegistrationScreenState extends State<DoctorRegistrationScreen>{
  String from  = 'register';
  String generateOtp  = '1234';
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  AppBar(
          backgroundColor: const Color(0x3FFFF00),
          elevation: 0,
          title: Text('',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900)),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    // Get.isDarkMode? Positioned(
                    //     left: 140,
                    //     width: 80,
                    //     height: 120,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //               image: AssetImage('assets/images/light-1.png')
                    //           )
                    //       ),
                    //     )
                    // ):Positioned(
                    //     left: 140,
                    //     width: 80,
                    //     height: 150,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //               image: AssetImage('assets/images/light-2.png')
                    //           )
                    //       ),
                    //     )
                    // ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text("Registration", style:  GoogleFonts.comfortaa(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                        )
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Colors.black54,
                            elevation: 8,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          labelText: 'Name',labelStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                          hintText: 'Enter your name',hintStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                      )
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          labelText: 'Designation',labelStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                          hintText: 'Enter your designation',hintStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                      )
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          labelText: 'Work place',labelStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                          hintText: 'Current work place',hintStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                      )
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          labelText: 'Chaimber',labelStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                          hintText: 'Personal chaimber',hintStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                      )
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          labelText: Languages.of(context)!.emergencyContactLabel,labelStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                          hintText: Languages.of(context)!.emergencyContactHint,hintStyle: GoogleFonts.comfortaa(
                                        fontSize: 15,
                                      )
                                      ),
                                      autofocus: false,
                                    ),
                                  ),
                                  SizedBox(height: 12,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(from, generateOtp)));
                            },
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFF01A9B8)
                                ),
                                child: Center(
                                  child: Text("Register", style: GoogleFonts.comfortaa(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}
