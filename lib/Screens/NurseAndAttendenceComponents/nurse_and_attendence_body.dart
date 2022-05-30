import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/common_operation.dart';
import '../../language/Languages.dart';
import '../../language/LocalConstant.dart';

class NurseAndAttendenseBody extends StatefulWidget {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'];
  @override
  _NurseAndAttendenseBodyState createState() => _NurseAndAttendenseBodyState();
}
class _NurseAndAttendenseBodyState extends State<NurseAndAttendenseBody> {
  List <String> surNameList = [
    'Mr.',
    'Mrs.',
    'Son of',
    'Daughter of',
    'Mister',
  ];
  List <String> nurseServiceList = [
    'Nurse.',
    'Care giver',
    'Medical guide',
    'Baby sitter/Nani',
    'Word boy/brother',
    'Doctor',
  ];
  List <String> workingPlaceList = [
    'Hospital.',
    'Home',
  ];
  String? _selectedAmbulanceCriteria, _selectedSurName, nurseServiceValue,workingPlaceValue, boyValue;
  int? nurseService_val, workingPlace_val, wardBoy_val;
  DateTime? startdate;
  DateTime? enddate;
  bool isEn = true;
  String initialDateText = 'Select date & time';
  String initialDateText1 = 'Select date & time';
  String initialDateTextBn = 'তারিখ এবং সময় নির্বাচন করুন';
  String initialDateTextBn1 = 'তারিখ এবং সময় নির্বাচন করুন';
  @override
  void initState() {
    setState(() {
      nurseService_val = 0;
      workingPlace_val = 0;
    });
    super.initState();
    startdate = DateTime.now();
    enddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final hours = startdate?.hour.toString().padLeft(2,'0');
    final minutes = startdate?.minute.toString().padLeft(2,'0');
    final List<Widget> sliderList = widget.carouselImageList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Stack(
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Carousel',
                            style: GoogleFonts.comfortaa(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              if (kDebugMode) {
                print('oneStopCall: ' + 'working');
              }
              var snackBar = const SnackBar(
                  content: Text('OneStop Service is Under processing!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0, right: 15),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.add_ic_call_rounded,
                      size: 15,
                      //color: Color(0xFF000000),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        Languages.of(context)!.oneStop,
                        style: GoogleFonts.comfortaa(
                          //color: const Color(0xFF000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        CarouselSlider(
            items: sliderList,
            options: CarouselOptions(
                autoPlay: true, enlargeCenterPage: true, aspectRatio: 2.5)),
        SizedBox(height: 15,),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Service name', style: GoogleFonts.comfortaa(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(nurseServiceList.length, (int index) {
            return Row(
              children: [
                Radio(
                  value: index,
                  groupValue: nurseService_val,
                  onChanged: _handleRadioValueChange,
                  activeColor: new Color(0xFF29A74A),
                ),
                Text(nurseServiceList[index].toString(), style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,)),
              ],
            );
          }),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text('Working place', style: GoogleFonts.comfortaa(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List<Widget>.generate(workingPlaceList.length, (int index) {
            return Row(
              children: [
                Radio(
                  value: index,
                  groupValue: workingPlace_val,
                  onChanged: _handleRadioValueChange1,
                  activeColor: new Color(0xFF29A74A),
                ),
                Text(workingPlaceList[index].toString(), style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,)),
              ],
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 5.0),
          child: Visibility(
            visible: workingPlace_val !=-1?true:false,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: workingPlace_val == 0?'Hospital name'
                      :workingPlace_val == 1?'Home address':'Not',labelStyle: GoogleFonts.comfortaa(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
                  hintText: workingPlace_val == 0?'Enter hospital name'
                      :workingPlace_val == 1?'Enter home address':'Not',hintStyle: GoogleFonts.comfortaa(
                fontSize: 15,
              )
              ),
              autofocus: false,
            ),
          ),
        ),
        SizedBox(height: 8,),
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
                      width: 1,
                      color: Colors.white
                    ),
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
                border: OutlineInputBorder(),
                labelText: 'Case summery',labelStyle: GoogleFonts.comfortaa(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
                hintText: 'Previous case summery/condition',hintStyle: GoogleFonts.comfortaa(
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
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Service start date', style: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,)),
              ),
            ),
            SizedBox(height: 8,),
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
                    isEn?initialDateText = '${startdate!.day}/${startdate!.month}/${startdate!.year} :: ${startdate!.hour} : ${startdate!.minute}':
                    initialDateTextBn = '${startdate!.day}/${startdate!.month}/${startdate!.year} :: ${startdate!.hour} : ${startdate!.minute}';

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
                              isEn?initialDateText:initialDateTextBn, style: GoogleFonts.comfortaa(
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
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Service end date', style: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,)),
              ),
            ),
            SizedBox(height: 8,),
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
                      enddate!.hour,
                      enddate!.minute

                  );
                  setState(() async{
                    enddate = newDateTime;

                    final newTime = await pickTime();
                    if(newTime == null) return;
                    final newDateTime1 = DateTime(
                        enddate!.year,
                        enddate!.month,
                        enddate!.day,
                        newTime.hour,
                        newTime.minute

                    );
                    setState(() {

                      enddate = newDateTime1;
                    });
                    isEn?initialDateText1 = '${enddate!.day}/${enddate!.month}/${enddate!.year} :: ${enddate!.hour} : ${enddate!.minute}':
                    initialDateTextBn1 = '${enddate!.day}/${enddate!.month}/${enddate!.year} :: ${enddate!.hour} : ${enddate!.minute}';

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
                              isEn?initialDateText1:initialDateTextBn1, style: GoogleFonts.comfortaa(
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
                border: OutlineInputBorder(),
                labelText: 'Email',labelStyle: GoogleFonts.comfortaa(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
                hintText: 'Your email address (optional)',hintStyle: GoogleFonts.comfortaa(
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
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
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
    );
  }
  void _handleRadioValueChange(int? value) {
    setState(() {
      nurseService_val = value!;

      switch (value) {
        case 0:
          nurseServiceValue = "Nurse";
          break;
        case 1:
          nurseServiceValue = "Care giver";
          break;
        case 2:
          nurseServiceValue = "Medical guide";
          break;
        case 3:
          nurseServiceValue = "Baby-sitter/Nani";
          break;
        case 4:
          nurseServiceValue = "Word boy/brother";
          break;
        case 5:
          nurseServiceValue = "Doctor";
          break;
      }
    });
  }
  void _handleRadioValueChange1(int? value) {
    setState(() {
      workingPlace_val = value!;

      switch (value) {
        case 0:
          workingPlaceValue = "Hospital";
          break;
        case 1:
          workingPlaceValue = "Home";
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

  // Future<DateTime?>pickDate1() => showDatePicker(
  //   context: context,
  //   initialDate: DateTime.now(),
  //   firstDate: DateTime(1990),
  //   lastDate: DateTime(2050),
  // );
  // Future<TimeOfDay?>pickTime1() => showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(hour: enddate!.hour, minute: enddate!.minute)
  // );

}
