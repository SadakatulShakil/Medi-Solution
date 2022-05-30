import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Screens/AmbulanceServiceScreen.dart';
import 'package:medical_application/Screens/DLabAndPathologyScreen.dart';
import 'package:medical_application/Screens/DoctorAppointmentScreen.dart';
import 'package:medical_application/Screens/ForDoctorScreen.dart';
import 'package:medical_application/Screens/HositalAdmissionScreen.dart';
import 'package:medical_application/Screens/MedicalVisaAndAboardTreatment.dart';
import 'package:medical_application/Screens/OneStopService.dart';
import 'package:medical_application/Screens/PhysiotherapyServiceScreen.dart';

import '../../language/Languages.dart';
import '../NurseAndAttendenceScreen.dart';
import '../PharmaceuticalAndMedEquipmentScreen.dart';
import '../TrainingAndWorkshopScreen.dart';

class DashBoardOption extends StatefulWidget{

  List<String> sliderImage;
  DashBoardOption({required this.sliderImage});

  @override
  _DashBoardOptionState createState() => _DashBoardOptionState();

}
class _DashBoardOptionState extends State<DashBoardOption>{
  @override
  Widget build(BuildContext contetx){
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
        CarouselSlider(items: sliderList, options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 3.0
        )),
        SizedBox(height: 10,),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorAppointment()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.white,
                          boxShadow: [
                            // BoxShadow(
                            //   color: Colors.grey.withOpacity(0.5),
                            //   spreadRadius: 2,
                            //   blurRadius: 2,
                            //   // changes position of shadow
                            // ),
                          ],
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(139, 0, 0, 0),
                            //     Color.fromARGB(0, 0, 0, 0)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.doctorAppointment, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalAdmissionService()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.hospitalAdmission, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DLabAndPathologyService()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.dLabAndPathology, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AmbulanceService()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.ambulanceService, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PhysiotherapyService()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.physiotherapyService, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingAndWorkshop()));
                      },
                      child: Container(
                        height: 90,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                              child: Text(Languages.of(context)!.trainingAndWorkshop, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NurseAndAttendence()));
                      },
                      child: Container(
                        height: 88,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                              child: Text(Languages.of(context)!.nursingAndGuide, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalVisaAndTreatment()));
                      },
                      child: Container(
                        height: 88,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                              child: Text(Languages.of(context)!.medicalVisaAndTreatment, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PharmaceuticalAndMedEquipment()));
                      },
                      child: Container(
                        height: 88,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                              child: Text(Languages.of(context)!.pharmacyAndMedicalEquipment, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OneStopService()));
                      },
                      child: Container(
                        height: 88,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color.fromARGB(0, 0, 0, 0),
                            //     Color.fromARGB(145, 0, 166, 255)
                            //   ],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // )
                          //color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.blue.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset('assets/images/service.png', width: 40,height: 40,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
                              child: Text(Languages.of(context)!.oneStopService, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                //color: const Color(0xFF000000),
                                fontSize: 12,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        CarouselSlider(items: sliderList, options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 3.0
        )),
        SizedBox(height: 5,),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForDoctorScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15.0),
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Color(0xFF01A9B8),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    // changes position of shadow
                  ),
                ],
              ),
              child:  Text(Languages.of(context)!.forDoctor, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,) ),
            ),
          ),
        ),

      ],
    );
  }
}


