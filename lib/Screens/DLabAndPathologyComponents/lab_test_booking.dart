import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Model/pathologyDataModel.dart';

import 'lab_test_booking_body.dart';

class LabTestBooking extends StatefulWidget{
  PathologyDataModel mPathologyData;
  String from;
  LabTestBooking(this.mPathologyData, this.from);


  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LabTestBooking>{
  @override
  Widget build(BuildContext context) {
    return initWidget(context, widget.mPathologyData, widget.from);
  }

  Widget initWidget(BuildContext context, PathologyDataModel mPathologyData, String from) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color(0xFF00A6FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(from == 'lab'?'Lab test booking':'Physiotherapy booking',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: LabTestBookingBody(mPathologyData, from),
    );
  }
}