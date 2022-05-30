import 'package:flutter/material.dart';

import 'doctor_body_option.dart';

class DoctorBody extends StatelessWidget{
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
              DoctorBodyOption(sliderImage: carouselImageList),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

}
