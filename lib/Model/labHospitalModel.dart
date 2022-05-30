import 'package:flutter/material.dart';

class LabHospitalModel {

  String image;
  String name;
  String location;
  String quotes;
  String testPrice;
  String testDiscount;

  LabHospitalModel(
      {
        required this.image,
        required this.name,
        required this.location,
        required this.quotes,
        required this.testPrice,
        required this.testDiscount
      }
      );


}