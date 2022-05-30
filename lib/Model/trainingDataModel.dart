import 'package:flutter/material.dart';

class  TrainingDataModel{

  String courseName;
  String courseDescription;
  String courseDuration;
  String coursePrice;
  String courseDiscount;


  TrainingDataModel(
      {
        required this.courseName,
        required this.courseDescription,
        required this.courseDuration,
        required this.coursePrice,
        required this.courseDiscount,
      }
      );


}