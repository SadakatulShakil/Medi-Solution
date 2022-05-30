import 'package:flutter/material.dart';
import 'package:medical_application/Model/hospitalModel.dart';

import '../../Helper/hospital_data.dart';
import 'hospitalListBody.dart';

class HospitalAdmissionBody extends StatelessWidget{
  List<HospitalModel> hospitalList = AllHospital;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:  HospitalListBody(hospitalList),
      ),
    );
  }

}
