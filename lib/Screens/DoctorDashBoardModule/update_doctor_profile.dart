import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateDoctorProfile extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<UpdateDoctorProfile> {

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF00A6FF),
        title: Text('Update profile',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Text(
                'Update profile Page'
            )
        ),
      ),
    );
  }
}