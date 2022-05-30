import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RegistrationScreen.dart';

class ForDoctorScreen extends StatefulWidget{
  @override
  _ForDoctorScreenState createState() => _ForDoctorScreenState();

}
class _ForDoctorScreenState extends State<ForDoctorScreen>{
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Get.isDarkMode? Positioned(
                          left: 140,
                          width: 80,
                          height: 180,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/light-1.png')
                                )
                            ),
                          )
                      ):Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/light-2.png')
                                )
                            ),
                          )
                      ),
                      Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text("Login", style:  GoogleFonts.comfortaa(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child:
                                    CountryCodePicker(
                                      initialSelection: 'BD',
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      favorite: ['+88','BD'],
                                      enabled: true,
                                      hideMainText: false,
                                      showFlagMain: true,
                                      showFlag: true,
                                      hideSearch: false,
                                      searchDecoration: InputDecoration(
                                        hintText: 'search by country code',
                                      ),
                                      showFlagDialog: true,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            border: OutlineInputBorder(),
                                            labelText: 'Your mobile no',labelStyle: GoogleFonts.comfortaa(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                            hintText: 'Enter your mobile no',hintStyle: GoogleFonts.comfortaa(
                                          fontSize: 15,
                                        )
                                        ),
                                        autofocus: false,
                                      ),
                                    ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF01A9B8)
                          ),
                          child: Center(
                            child: Text("Login", style: GoogleFonts.comfortaa(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("or login with", style:  GoogleFonts.comfortaa(),),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset('assets/icons/facebook.png', width: 50,height: 50,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset('assets/icons/google.png', width: 50,height: 50,),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorRegistrationScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Text("Do not register yet? Register", style:
                            GoogleFonts.comfortaa(color: const Color(0xFF01A9B8),
                            fontWeight: FontWeight.w900),),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

}
