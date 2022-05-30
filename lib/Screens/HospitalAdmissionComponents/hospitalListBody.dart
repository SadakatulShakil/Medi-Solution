import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/search_widget.dart';
import 'package:medical_application/Model/hospitalModel.dart';
import 'package:medical_application/Screens/HospitalAdmissionComponents/hospitalAdmissionFrom.dart';

import '../../Helper/hospital_data.dart';
import '../../language/Languages.dart';

class HospitalListBody extends StatefulWidget{
  List<HospitalModel> hospitalList;
  HospitalListBody(this.hospitalList);
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HospitalListBody> {
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
          hintText: Languages.of(context)!.searchLocationHint
      );

  void searchHospital(String query) {
    final hospitalList = AllHospital.where((mHospital) {
      final locationLower = mHospital.location.toLowerCase();
      final searchLower = query.toLowerCase();
      return locationLower.contains(searchLower);
    }
    ).toList();

    setState(() {
      this.query = query;
      widget.hospitalList = hospitalList;
    });
  }

  Widget buildHospital(HospitalModel mHospital) =>
      InkWell(
        onTap: (){
          print(mHospital.name+'///'+mHospital.location);
          Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalAdmissionForm()));
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
      );


}
