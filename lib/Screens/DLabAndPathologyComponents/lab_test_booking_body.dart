import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Model/pathologyDataModel.dart';

import '../../language/Languages.dart';

class LabTestBookingBody extends StatefulWidget{
  PathologyDataModel mPathologyData;
  String from;
  LabTestBookingBody(this.mPathologyData, this.from);


  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LabTestBookingBody>{
  String initialDateText = 'Select date & time';
  int? service_val, sex_val, incentive_val;
  String? _selectedSurName, serviceValue, sexValue, incentiveValue;
  List <String> surNameList = [
    'Mr.',
    'Mrs.',
    'Son of',
    'Daughter of',
    'Mister',
  ];

  DateTime? startdate;
  @override
  void initState() {
    setState(() {
      service_val = 0;
      sex_val = -1;
      incentive_val = -1;
    });
    super.initState();
    startdate = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(context, widget.mPathologyData, widget.from);
  }

  Widget initWidget(BuildContext context, PathologyDataModel mPathologyData, String from) {
    //String initialDateText = Languages.of(context)!.admissionDateHint;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 15.0),
                  child: Visibility(
                    visible: from == 'lab'?true:false,
                    child: Text(mPathologyData.testName, style: GoogleFonts.comfortaa(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,)),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 15.0),
                  child: Visibility(
                    visible: from == 'lab'?true:false,
                    child: Text(
                      mPathologyData.testDescription,style: GoogleFonts.comfortaa(
                      color: Colors.grey,
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Service criteria', style: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: service_val,
                        onChanged: _handleRadioValueChange,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text('At Hospital', style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                      Radio(
                        value: 1,
                        groupValue: service_val,
                        onChanged: _handleRadioValueChange,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text('From Home', style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        width: width,
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white,
                              width: 1),
                        ),
                        child:DropdownButton<String>(
                          // Not necessary for Option 1
                          underline: SizedBox(),
                          hint: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Sur name',
                              style: GoogleFonts.comfortaa(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          value: _selectedSurName,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              //hint = '';
                              _selectedSurName = newValue;
                              print("Accoutn no: " + _selectedSurName.toString());
                            });
                          },
                          items: surNameList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: GoogleFonts.comfortaa(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,)),
                            );
                          })
                              .toList(),
                        ),
                      ),
                    ),),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: Languages.of(context)!.patientNameLabel,labelStyle: GoogleFonts.comfortaa(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                            hintText: Languages.of(context)!.patientNameHint,hintStyle: GoogleFonts.comfortaa(
                          fontSize: 15,
                        )
                        ),
                        autofocus: false,
                      ),
                    ),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: Languages.of(context)!.ageLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.ageHint,hintStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                  )
                  ),
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: Languages.of(context)!.presentAddressLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.presentAddressHint,hintStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                  )
                  ),
                  autofocus: false,
                ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 15.0),
                        child: Text('Lab test date', style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,)),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
                    child: InkWell(
                      onTap: () async{
                        FocusManager.instance.primaryFocus?.unfocus();
                        final newDate = await pickDate();
                        if(newDate == null) return;
                        final newDateTime = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            startdate!.hour,
                            startdate!.minute

                        );
                        setState(() async{
                          startdate = newDateTime;

                          final newTime = await pickTime();
                          if(newTime == null) return;
                          final newDateTime1 = DateTime(
                              startdate!.year,
                              startdate!.month,
                              startdate!.day,
                              newTime.hour,
                              newTime.minute

                          );
                          setState(() {

                            startdate = newDateTime1;
                          });
                          initialDateText = '${startdate!.day}/${startdate!.month}/${startdate!.year} :: ${startdate!.hour} : ${startdate!.minute}';

                        });
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 7,
                                offset: Offset(0,2)
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0, left: 5.0),
                                  child: Text(
                                    initialDateText, style: GoogleFonts.comfortaa(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                  ),
                                ),
                                Icon(Icons.calendar_today_rounded,
                                    size: 15,
                                    color: Colors.black54),
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: 'Email address (optional)',labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: 'Your email address',hintStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                  )
                  ),
                  autofocus: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: Languages.of(context)!.emergencyContactLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.emergencyContactHint,hintStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                  )
                  ),
                  autofocus: false,
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
                child: InkWell(
                  onTap: () async{
                    /// continue button task
                  },
                  child: Container(
                    width: (width/2 + width/4),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A6FF),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            offset: Offset(0,3)
                        )
                      ],
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Color(0XFF00A6FF)),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            Languages.of(context)!.continueBtn, style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      service_val = value!;

      switch (value) {
        case 0:
          serviceValue = "At hospital";
          break;
        case 1:
          serviceValue = "From Home";
          break;
      }
    });
  }
  Future<DateTime?>pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
  );
  Future<TimeOfDay?>pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: startdate!.hour, minute: startdate!.minute)
  );
}
