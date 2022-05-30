import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../language/Languages.dart';

class HospitalAdmissionForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HospitalAdmissionForm>{
  String initialDateText = 'Select date & time';
  List <String> cabinCriteriaList = [
    'AC single cabin',
    'AC double cabin',
    'AC deluxe cabin',
    'Non AC cabin',
    'General word',
  ];
  List <String> incentiveCareList = [
    'ICU',
    'NICU',
    'CCU',
    'HDU',
    'PICU',
  ];
  List <String> surNameList = [
    'Mr.',
    'Mrs.',
    'Son of',
    'Daughter of',
    'Mister',
  ];

  String? _selectedCabinCriteria, _selectedSurName, patientValue, sexValue, incentiveValue;
  int? patient_val, sex_val, incentive_val;
  DateTime? startdate;

  @override
  void initState() {
    setState(() {
      patient_val = 0;
      sex_val = -1;
      incentive_val = -1;
    });
    super.initState();
    startdate = DateTime.now();
  }


  @override
  Widget build(BuildContext context) {
    //String initialDateText = Languages.of(context)!.admissionDateHint;
    // TODO: implement build
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6FF),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(Languages.of(context)!.bookingForm,
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(Languages.of(context)!.choosePatientCriteria, style: GoogleFonts.comfortaa(
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
                        groupValue: patient_val,
                        onChanged: _handleRadioValueChange,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text(Languages.of(context)!.emergency, style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                      Radio(
                        value: 1,
                        groupValue: patient_val,
                        onChanged: _handleRadioValueChange,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text(Languages.of(context)!.general, style: GoogleFonts.comfortaa(
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
                            // //color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //       //color: Colors.black,
                            //   )
                            // ],
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
                      labelText: Languages.of(context)!.careOfLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.careOfHint,hintStyle: GoogleFonts.comfortaa(
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
                      labelText: Languages.of(context)!.currentLocationLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.currentLocationHint,hintStyle: GoogleFonts.comfortaa(
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
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: Languages.of(context)!.problemSummeryLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.problemSummeryHint,hintStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                  )
                  ),
                  autofocus: false,
                ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(Languages.of(context)!.admissionDate, style: GoogleFonts.comfortaa(
                        fontSize: 15,
                        //color: Colors.black,
                        fontWeight: FontWeight.w700,)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
                    child: InkWell(
                      onTap: () async{
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
                          String dateTimeText = '${startdate!.day}/${startdate!.month}/${startdate!.year} :: ${startdate!.hour} : ${startdate!.minute}';
                          initialDateText = dateTimeText;
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(Languages.of(context)!.sex, style: GoogleFonts.comfortaa(
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
                        groupValue: sex_val,
                        onChanged: _handleRadioValueChange1,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text(Languages.of(context)!.radioMale, style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                      Radio(
                        value: 1,
                        groupValue: sex_val,
                        onChanged: _handleRadioValueChange1,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text(Languages.of(context)!.radioFemale, style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                      Radio(
                        value: 2,
                        groupValue: sex_val,
                        onChanged: _handleRadioValueChange1,
                        activeColor: new Color(0xFF29A74A),
                      ),
                      Text(Languages.of(context)!.radioOther, style: GoogleFonts.comfortaa(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  width: width,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.grey,
                    //       blurRadius: 7,
                    //       offset: Offset(0,2)
                    //   )
                    // ],
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
                      child: Text(Languages.of(context)!.cabinCriteriaHint,
                        style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    value: _selectedCabinCriteria,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        //hint = '';
                        _selectedCabinCriteria = newValue;
                        print("Accoutn no: " + _selectedCabinCriteria.toString());
                      });
                    },
                    items: cabinCriteriaList.map<DropdownMenuItem<String>>((String value) {
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
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Visibility(
                    visible: patient_val == 1? false:true,
                    child: Text(Languages.of(context)!.incentiveCare, style: GoogleFonts.comfortaa(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Visibility(
                  visible: patient_val == 1? false:true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(incentiveCareList.length, (int index) {
                      return Row(
                        children: [
                          Radio(
                            value: index,
                            groupValue: incentive_val,
                            onChanged: _handleRadioValueChange2,
                            activeColor: new Color(0xFF29A74A),
                          ),
                          Text(incentiveCareList[index].toString(), style: GoogleFonts.comfortaa(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,)),
                        ],
                      );
                    }),
                  ),
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
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: Languages.of(context)!.optionalContactLabel,labelStyle: GoogleFonts.comfortaa(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                      hintText: Languages.of(context)!.optionalContactHint,hintStyle: GoogleFonts.comfortaa(
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
                    print('>>>>>>>>>>>>>: '+incentiveValue.toString());
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
      patient_val = value!;

      switch (value) {
        case 0:
          patientValue = "Emergency";
          break;
        case 1:
          patientValue = "General";
          break;
      }
    });
  }
  void _handleRadioValueChange1(int? value) {
    setState(() {
      sex_val = value!;

      switch (value) {
        case 0:
          sexValue = "Male";
          break;
        case 1:
          sexValue = "Female";
          break;
        case 2:
          sexValue = "Other";
          break;
      }
    });
  }
  void _handleRadioValueChange2(int? value) {
    setState(() {
      incentive_val = value!;
      switch (value) {
        case 0:
          incentiveValue = "ICU";
          break;
        case 1:
          incentiveValue = "NICU";
          break;
        case 2:
          incentiveValue = "CCU";
          break;
        case 3:
          incentiveValue = "HDU";
          break;
        case 4:
          incentiveValue = "PCCU";
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