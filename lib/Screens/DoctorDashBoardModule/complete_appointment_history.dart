import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompleteAppointmentHistory extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<CompleteAppointmentHistory> {

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00A6FF),
        title: Text('Appointment History',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Text(
                'Complete Appointment History'
            )
        ),
      ),
    );
  }
}