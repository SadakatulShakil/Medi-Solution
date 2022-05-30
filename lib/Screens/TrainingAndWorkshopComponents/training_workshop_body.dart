import 'dart:ffi';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/training_data.dart';
import 'package:medical_application/Model/trainingDataModel.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/online_doctor_body.dart';

import '../../language/Languages.dart';

class TrainingAndWorkshopBody extends StatefulWidget {
  List<TrainingDataModel> trainingDataList = AllTrainingData;
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];


  @override
  _TrainingAndWorkshopBodyState createState() =>
      _TrainingAndWorkshopBodyState();
}

class _TrainingAndWorkshopBodyState extends State<TrainingAndWorkshopBody> {
  final List<Color> colors = [
    Colors.lightBlueAccent,
    Colors.indigoAccent,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.brown,
    Colors.black54,
    Colors.lightGreen,
    Colors.teal,
    Colors.pinkAccent,
  ];
  Color randomGenerator() {
    return colors[new Random().nextInt(12)];
  }

  @override
  void initState() {
    super.initState();
    //setState(() => index = random.nextInt(5));
    //widget.hospitalList = AllHospital;
  }

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 8),
            child: Text('Our offered training',
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w900,
                )),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: ListView.builder(
                  itemCount: widget.trainingDataList.length,
                  itemBuilder: (context, index) {
                    final mPathologyData = widget.trainingDataList[index];

                    return buildTrainingData(mPathologyData, context, colors);
                  })),
        ),
      ],
    );
  }

  Widget buildTrainingData(
      TrainingDataModel mTrainingData, BuildContext context, List<dynamic> colors) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return InkWell(
      onTap: () {
        print(mTrainingData.courseName + '///');
        //Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalAdmissionForm()));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: randomGenerator(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    )
                  ),
                  height: height/6.5,
                  width: 120,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mTrainingData.courseName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 5.0, bottom: 5.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mTrainingData.courseDescription,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.comfortaa(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Duration : ' + mTrainingData.courseDuration,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.comfortaa(
                              color: const Color(0xFF00A6FF),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price :' + mTrainingData.coursePrice,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.comfortaa(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
                              ),
                            ),
                            Wrap(
                                crossAxisAlignment:
                                    WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.discount_outlined,
                                      size: 15,
                                      color: const Color(0xFF00A6FF)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                        mTrainingData.courseDiscount+' %',
                                        style: GoogleFonts.comfortaa(
                                        color: const Color(0xFF00A6FF),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
