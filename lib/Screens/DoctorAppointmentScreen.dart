import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../language/Languages.dart';
import 'DoctorApointmentComponents/doctor_body.dart';

class DoctorAppointment extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<DoctorAppointment> {

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color(0xFF00A6FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(Languages.of(context)!.appBarDocAppointment,
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: DoctorBody(),
    );
  }
  }