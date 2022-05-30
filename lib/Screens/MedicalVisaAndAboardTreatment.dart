import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MedicalVisaAndTreatmentComnents/med_visa_and_treatment_body.dart';
import 'NurseAndAttendenceComponents/nurse_and_attendence_body.dart';

class MedicalVisaAndTreatment extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<MedicalVisaAndTreatment> {

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
        title: Text('Medical visa & treatment',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: MedicalVisaAndTreatmentBody(),
    );
  }
}