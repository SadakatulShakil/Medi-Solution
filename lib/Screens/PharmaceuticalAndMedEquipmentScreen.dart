import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PharmaceuticalAndMedEquipmentComponents/pharma_and_med_body.dart';

class PharmaceuticalAndMedEquipment extends StatefulWidget{
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];

  @override
  State<StatefulWidget> createState() => InitState();

}
class InitState extends State<PharmaceuticalAndMedEquipment> {

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
        title: Text('Pharma & Medical',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: PharmaceuticalAndMedEquipmentBody(widget.carouselImageList),
    );
  }
}
