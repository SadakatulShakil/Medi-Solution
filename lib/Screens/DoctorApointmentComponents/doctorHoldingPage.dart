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

class DoctorHolding extends StatefulWidget{
  List<DoctoreModel> doctorList = AllDoctor;
  //List<HospitalModel> hospitalList = AllHospital;
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<DoctorHolding> {
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
          title: Text('Doctor List',
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
              dialog(mDoctor);
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

  void dialog(DoctoreModel mDoctor) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Align(
                    alignment: Alignment.center,
                    child: Text('Profile',style: GoogleFonts.comfortaa(
                        fontSize: 18
                    )),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context, false);
                          },
                          child: Icon(Icons.cancel_outlined))),
                ]),

            content: Container(
              height: MediaQuery.of(context).size.height/2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/user.png', width: 100,height: 100,),
                    Text(mDoctor.name,textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900, fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(mDoctor.designation,textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900, fontSize: 12)),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Speciality',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.speciality,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Divider(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Degrees',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.degrees,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Working Place & Position',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.workingPlaceAndPosition,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Chamber 1',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.chamber1,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Chamber 2',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.chamber2,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Chamber 3',
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mDoctor.chamber3,
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Price',
                                    style: GoogleFonts.comfortaa(
                                        color: Color(0xFF01A9B8),
                                        fontWeight: FontWeight.w900, fontSize: 15)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Text('450 bdt',
                                    style: GoogleFonts.comfortaa(
                                        color: Color(0xFF01A9B8),
                                        fontWeight: FontWeight.w900, fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Icon(Icons.discount_outlined,
                                          size: 15,
                                          color: Colors.grey),
                                      Text(
                                        'discount ' + '10' + ' %',
                                        style: GoogleFonts.comfortaa(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0,),
                                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF01A9B8),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:  Text(Languages.of(context)!.continueBtn, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,) ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

}
