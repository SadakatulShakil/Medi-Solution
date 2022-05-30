import 'package:flutter/material.dart';

import '../DoctorApointmentComponents/doctor_body_option.dart';
import 'ambulance_body_option.dart';

class AmbulanceBody extends StatelessWidget{
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              AmbulanceBodyOption(sliderImage: carouselImageList),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

}