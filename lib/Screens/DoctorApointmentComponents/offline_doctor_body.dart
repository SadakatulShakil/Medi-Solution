import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/hospital_search_page.dart';

import '../../language/Languages.dart';
import 'department_selection_page.dart';
import 'doctor_search_page.dart';

class OfflineDoctorBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<OfflineDoctorBody> {
  String query = '';

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  child:  TabBar(
                    indicator: BoxDecoration(
                        color: const Color(0xFF00A6FF),
                        borderRadius:  BorderRadius.circular(25.0)
                    ) ,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const  [
                      Tab(text: 'Doctor ',),
                      Tab(text: 'Hospital ',),
                      Tab(text: 'Department ',)
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                    children:  [
                      DoctorSearch(),
                      HospitalSearch(),
                      DepartmentSelection(),
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}
