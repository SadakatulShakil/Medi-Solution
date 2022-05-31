import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/search_widget.dart';
import 'package:medical_application/Model/hospitalModel.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/departmentHoldingPage.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/doctorHoldingPage.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/hospitalHoldingPage.dart';

import '../../Helper/hospital_data.dart';

class HospitalHolding extends StatefulWidget{
  //List<DoctoreModel> doctorList = AllDoctor;
  List<HospitalModel> hospitalList = AllHospital;
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HospitalHolding> {
  String query = '';
  @override
  void initState() {
    super.initState();

    widget.hospitalList = AllHospital;
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(widget.hospitalList);
  }

  Widget initWidget(List<HospitalModel> hospitalList) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: const Color(0xFF00A6FF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Hospital List',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900, fontSize: 18)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            buildSearch(),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ListView.builder(
                      itemCount: hospitalList.length,
                      itemBuilder: (context, index) {
                        final mHospital = hospitalList[index];

                        return buildHospital(mHospital);
                      }
                  )
              ),
            ),
          ],
        )
    );
  }

  Widget buildSearch() =>
      SearchWidget(
          text: query,
          onChanged: searchHospital,
          hintText: 'search by doctor Hospital'
      );

  void searchHospital(String query) {
    final hospitalList = AllHospital.where((mHospital) {
      final nameLower = mHospital.name.toLowerCase();
      //final designationLower = mHospital.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }
    ).toList();

    setState(() {
      this.query = query;
      widget.hospitalList = hospitalList;
    });
  }

  Widget buildHospital(HospitalModel mHospital) =>
      Column(
        children: [
          InkWell(
            onTap: (){
              print(mHospital.name+'///'+mHospital.location);
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorHolding()));
            },
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/' + mHospital.image, width: 40, height: 40,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 5.0, bottom: 5.0),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: Text(mHospital.name,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w900,
                                    ),),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: Text(mHospital.location,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w900,
                                    ),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(mHospital.quotes, style: GoogleFonts.comfortaa(
                            color: Colors.grey,
                          ),))
                    ],
                  ),
                )
            ),
          )
        ],
      );

}
