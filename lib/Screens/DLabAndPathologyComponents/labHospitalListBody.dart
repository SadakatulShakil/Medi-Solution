import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/labHospital_data.dart';
import 'package:medical_application/Helper/search_widget.dart';
import 'package:medical_application/Model/hospitalModel.dart';
import 'package:medical_application/Model/pathologyDataModel.dart';
import 'package:medical_application/Screens/DLabAndPathologyComponents/lab_test_booking_body.dart';
import 'package:medical_application/Screens/HospitalAdmissionComponents/hospitalAdmissionFrom.dart';

import '../../Helper/hospital_data.dart';
import '../../Model/labHospitalModel.dart';
import '../../language/Languages.dart';
import 'lab_test_booking.dart';

class LabHospitalListBody extends StatefulWidget{
  List<LabHospitalModel> labHospitalList;
  String from;
  PathologyDataModel mPathologyData;
  LabHospitalListBody(this.labHospitalList, this.mPathologyData, this.from);
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LabHospitalListBody> {
  String query = '';
  @override
  void initState() {
    super.initState();

    widget.labHospitalList = AllLabHospital;
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(widget.labHospitalList, widget.mPathologyData, widget.from);
  }

  Widget initWidget(List<LabHospitalModel> labHospitalList, PathologyDataModel mPathologyData, String from) {
    return Scaffold(
        appBar:  AppBar(
          backgroundColor: const Color(0xFF00A6FF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(from == 'lab'?'Lab Hospital List':'Physiotherapy Hospital',
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
                          size: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            Languages.of(context)!.oneStop, style: GoogleFonts.comfortaa(
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
            SizedBox(height: 8,),
            //buildSearch(),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ListView.builder(
                      itemCount: labHospitalList.length,
                      itemBuilder: (context, index) {
                        final mHospital = labHospitalList[index];

                        return buildHospital(mHospital, mPathologyData, from);
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
          hintText: Languages.of(context)!.searchLocationHint
      );

  void searchHospital(String query) {
    final hospitalList = AllLabHospital.where((mHospital) {
      final locationLower = mHospital.location.toLowerCase();
      final searchLower = query.toLowerCase();
      return locationLower.contains(searchLower);
    }
    ).toList();

    setState(() {
      this.query = query;
      widget.labHospitalList = hospitalList;
    });
  }

  Widget buildHospital(LabHospitalModel mHospital, PathologyDataModel mPathologyData, String from) =>
      InkWell(
        onTap: (){
          print(mHospital.name+'///'+mHospital.location);
          Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestBooking(mPathologyData, from)));
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
                                    fontWeight: FontWeight.w900,),),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child: Text(mHospital.location,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.comfortaa(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w900,),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mHospital.quotes, style: GoogleFonts.comfortaa(
                          color: Colors. grey),)),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: ' + mHospital.testPrice + ' bdt',
                            style: GoogleFonts.comfortaa(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,)),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.discount_outlined,
                                    size: 15,
                                    color: Colors.grey),
                                Text(
                                  'discount ' + mHospital.testDiscount + ' %',
                                  style: GoogleFonts.comfortaa(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      );


}
