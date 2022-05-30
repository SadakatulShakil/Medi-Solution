import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/offline_doctor_body.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/online_doctor_body.dart';

import '../../language/Languages.dart';

class DoctorBodyOption extends StatefulWidget{

  List<String> sliderImage;
  DoctorBodyOption({required this.sliderImage});

  @override
  _DoctorBodyOptionState createState() => _DoctorBodyOptionState();

}

class _DoctorBodyOptionState extends State<DoctorBodyOption> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    final List<Widget> sliderList =
    widget.sliderImage.map((item) =>
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.cover, width: 1000,),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Carousel', style: GoogleFonts.comfortaa(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        )).toList();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: (){
              if (kDebugMode) {
                print('oneStopCall: '+'working');
              }
              var snackBar = const SnackBar(content: Text('OneStop Service is Under processing!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0, right: 15),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.add_ic_call_rounded,
                      size: 15,
                      //color: Color(0xFF000000),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        Languages.of(context)!.oneStop, style: GoogleFonts.comfortaa(
                        //color: const Color(0xFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
        CarouselSlider(items: sliderList, options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0
        )),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 25.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                height: 150.0,
                child: SizedBox.fromSize(
                  size: Size(150, 150), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Color(0xFF62A564), // button color
                      child: InkWell(
                        splashColor: Color(0xFFFFFFFF),
                        // splash color
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineDoctorBody()));
                        },
                        // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.wifi,
                              size: 35.0,
                              color: Colors.white,
                            ), // icon
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  Languages.of(context)!.onlineDoctor,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 20.0,
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                height: 150.0,
                child: SizedBox.fromSize(
                  size: Size(150, 150), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Color(0xFF0274A8), // button color
                      child: InkWell(
                        splashColor: Color(0xFFFFFFFF),
                        // splash color
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OfflineDoctorBody()));
                        },
                        // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.wifi_off_rounded,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8.0,),// icon
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  Languages.of(context)!.offlineDoctor,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}