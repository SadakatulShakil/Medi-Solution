import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/search_widget.dart';
import 'package:medical_application/Model/doctorModel.dart';
import 'package:medical_application/Model/hospitalModel.dart';
import 'package:medical_application/Screens/HospitalAdmissionComponents/hospitalAdmissionFrom.dart';

import '../../Helper/doctor_data.dart';
import '../../Helper/hospital_data.dart';
import '../../language/Languages.dart';

class OnlineDoctorBody extends StatefulWidget{
  List<DoctoreModel> doctorList = AllDoctor;
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<OnlineDoctorBody> {
  String query = '';

  @override
  void initState() {
    super.initState();

    widget.doctorList = AllDoctor;
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(widget.doctorList);
  }

  Widget initWidget(List<DoctoreModel> doctorList) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: const Color(0xFF00A6FF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Online doctor list',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900, fontSize: 18)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            InkWell(
              onTap: (){
                if (kDebugMode) {
                  print('oneStopCall: '+'working');
                }
                var snackBar = const SnackBar(content: Text('OneStop Service is Under processing!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 15),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.add_ic_call_rounded,
                          size: 15,
                          //color: Color(0xFF000000),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            Languages.of(context)!.oneStop, style: GoogleFonts.comfortaa(
                            //color: const Color(0xFF000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ),
            buildSearch(),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ListView.builder(
                      itemCount: doctorList.length,
                      itemBuilder: (context, index) {
                        final mDoctor = doctorList[index];

                        return buildDoctor(mDoctor);
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
          onChanged: searchDoctor,
          hintText: 'search by doctor name'

      );

  void searchDoctor(String query) {
    final doctorList = AllDoctor.where((mDoctor) {
      final nameLower = mDoctor.name.toLowerCase();
      final designationLower = mDoctor.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower) || designationLower.contains(searchLower);
    }
    ).toList();

    setState(() {
      this.query = query;
      widget.doctorList = doctorList;
    });
  }

  Widget buildDoctor(DoctoreModel mDoctor) =>
      Column(
        children: [
          InkWell(
            onTap: (){
              print(mDoctor.name+'///');
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalAdmissionForm()));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/' + mDoctor.image, width: 40, height: 40,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 5.0, bottom: 5.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.5,
                                      child: Text(mDoctor.name,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w900,
                                            color: Colors. black),),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.5,
                                      child: Text(mDoctor.designation,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w900,
                                            color: Colors. black),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(mDoctor.workingPlaceAndPosition, style: GoogleFonts.comfortaa(
                                  color: Colors. black),))
                        ],
                      ),
                    ),
                  )
              ),
            ),

          ),

        ],
      );
}
