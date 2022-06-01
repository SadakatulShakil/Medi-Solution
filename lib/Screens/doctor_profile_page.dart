import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../language/Languages.dart';
import 'DoctorApointmentComponents/doctor_body.dart';
import 'OneStopServiceComponents/one_stop_service_body.dart';

class DoctorProfilePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<DoctorProfilePage> {

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00A6FF),
        title: Text('Profile',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Center(
            child: Text(
                'Profile'
            )
        ),
      ),
    );
  }
}