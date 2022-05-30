import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../language/Languages.dart';
import 'DoctorApointmentComponents/doctor_body.dart';
import 'OneStopServiceComponents/one_stop_service_body.dart';

class OneStopService extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<OneStopService> {

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
        title: Text('One-Stop Service',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: OneStopServiceBody(),
    );
  }
}