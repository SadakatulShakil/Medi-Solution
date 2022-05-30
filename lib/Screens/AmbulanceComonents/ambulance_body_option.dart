import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Helper/common_operation.dart';
import '../../language/Languages.dart';

class AmbulanceBodyOption extends StatefulWidget{
  List<String> sliderImage;
  AmbulanceBodyOption({required this.sliderImage});


  @override
  _AmbulanceBodyOptionState createState() => _AmbulanceBodyOptionState();

}

class _AmbulanceBodyOptionState extends State<AmbulanceBodyOption> {
  List <String> surNameList = [
    'Mr.',
    'Mrs.',
    'Son of',
    'Daughter of',
    'Mister',
  ];
  List <String> ambulanceCriteriaList = [
    'Mini Ambulance',
    'Regular Ambulance',
    '6 Sitter Ambulance',
    'ICU Ambulance',
    'Freezer Ambulance',
    'Air Ambulance',
  ];
  String? _selectedAmbulanceCriteria, _selectedSurName, doctorValue, boyValue;
  int? doctor_val, wardBoy_val;
  DateTime? startdate;
  bool isEn = true;
  String initialDateText = 'Select date & time';
  String initialDateTextBn = 'তারিখ এবং সময় বাছাই করুন';

  @override
  void initState() {
    setState(() {
      doctor_val = 0;
      wardBoy_val = -1;
    });
    super.initState();
    startdate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final hours = startdate?.hour.toString().padLeft(2,'0');
    final minutes = startdate?.minute.toString().padLeft(2,'0');
    final List<Widget> sliderList =
    widget.sliderImage.map((item) =>
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.cover, width: 1000,),
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
                        )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Carousel', style: GoogleFonts.comfortaa(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        )).toList();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: (){
              if (kDebugMode) {
                print('oneStopCall: '+'working');
              }
              var snackBar = const SnackBar(content: Text('OneStop Service is Under processing!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0, right: 15),
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
        CarouselSlider(items: sliderList, options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.5
        )),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Languages.of(context)!.bookingForm, style: GoogleFonts.comfortaa(
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),),
          ),
        ),
        SizedBox(height: 10,),
        Column(
          children: [
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
                        border: Border.all(width: 1, color: Colors.white),
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
                    labelText: Languages.of(context)!.destinationLabel,labelStyle: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                    hintText: Languages.of(context)!.destinationHint,hintStyle: GoogleFonts.comfortaa(
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
                    labelText: Languages.of(context)!.emergencyContactLabel,labelStyle: GoogleFonts.comfortaa(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                    hintText: Languages.of(context)!.destinationLabel,hintStyle: GoogleFonts.comfortaa(
                  fontSize: 15,
                )
                ),
                autofocus: false,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Container(
            width: width,
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child:DropdownButton<String>(
              // Not necessary for Option 1
              underline: SizedBox(),
              hint: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(Languages.of(context)!.ambulanceCriteriaHint,
                    style: GoogleFonts.comfortaa(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                ),
              ),
              value: _selectedAmbulanceCriteria,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  //hint = '';
                  _selectedAmbulanceCriteria = newValue;
                  print("Accoutn no: " + _selectedAmbulanceCriteria.toString());
                });
              },
              items: ambulanceCriteriaList.map<DropdownMenuItem<String>>((String value) {
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
            child: Text(Languages.of(context)!.chooseDoctorOption, style: GoogleFonts.comfortaa(
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
                      groupValue: doctor_val,
                      onChanged: _handleRadioValueChange,
                      activeColor: new Color(0xFF29A74A),
                    ),
                    Text(Languages.of(context)!.radioWithDoc, style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,)),
                    Radio(
                      value: 1,
                      groupValue: doctor_val,
                      onChanged: _handleRadioValueChange,
                      activeColor: new Color(0xFF29A74A),
                    ),
                    Text(Languages.of(context)!.radioWithOutDoc, style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,)),
                  ],
                ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(Languages.of(context)!.chooseWordBoyOption, style: GoogleFonts.comfortaa(
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
                new Radio(
                  value: 0,
                  groupValue: wardBoy_val,
                  onChanged: _handleRadioValueChange1,
                  activeColor: new Color(0xFF29A74A),
                ),
                new Text(Languages.of(context)!.radioWithBoy, style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,)),
                new Radio(
                  value: 1,
                  groupValue: wardBoy_val,
                  onChanged: _handleRadioValueChange1,
                  activeColor: new Color(0xFF29A74A),
                ),
                new Text(Languages.of(context)!.radioWithOutBoy, style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,)),
              ],
            ),
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
                  child: Text(Languages.of(context)!.price, style: GoogleFonts.comfortaa(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.discount_outlined,
                          size: 15,
                          color: Colors.grey),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, left: 5.0),
                          child: Text(
                            Languages.of(context)!.discount, style: GoogleFonts.comfortaa(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    width: width/3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('10,000 bdt', style: GoogleFonts.comfortaa(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    width: width/4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('10'+' %', style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(Languages.of(context)!.advanceBooking, style: GoogleFonts.comfortaa(
                  fontSize: 15,
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
        )
      ],
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      doctor_val = value!;

      switch (value) {
        case 0:
          doctorValue = "With doctor";
          break;
        case 1:
          doctorValue = "Without doctor";
          break;
      }
    });
  }
  void _handleRadioValueChange1(int? value) {
    setState(() {
      wardBoy_val = value!;

      switch (value) {
        case 0:
          boyValue = "With boy/brother";
          break;
        case 1:
          boyValue = "Without boy/brother";
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