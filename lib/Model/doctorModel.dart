import 'package:flutter/material.dart';

class DoctoreModel {

  String name;
  String image;
  String designation;
  String speciality;
  String degrees;
  String workingPlaceAndPosition;
  String chamber1;
  String chamber2;
  String chamber3;
  String fees;
  String discount;

  DoctoreModel(
      {
        required this.name,
        required this.image,
        required this.designation,
        required this.speciality,
        required this.degrees,
        required this.workingPlaceAndPosition,
        required this.chamber1,
        required this.chamber2,
        required this.chamber3,
        required this.fees,
        required this.discount
      }
      );


}