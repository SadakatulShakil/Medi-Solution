import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../language/Languages.dart';
import 'DLabAndPathologyComponents/d_lab_pathology_body.dart';
import 'DoctorApointmentComponents/doctor_body.dart';

class DLabAndPathologyService extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<DLabAndPathologyService> {

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
        title: Text('D-Lab & Pathology Service',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: DLabAndPathologyBody(),
    );
  }
}