import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorHomePageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
// TODO: implement createState

}

class InitState extends State<DoctorHomePageBody> {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> sliderList =
    carouselImageList.map((item) =>
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
    // TODO: implement build
    return inItWidget(sliderList);
  }

  Widget inItWidget(List<Widget> sliderList) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          CarouselSlider(items: sliderList, options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0
          )),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Today you have',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              fontSize: 12)),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('6',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900,
                              fontSize: 15)),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Appointments',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                        ),
                      ],
                    ),
                    Container(
                      height: 100.0,
                      width: 1.0,
                      color: Colors.black26,
                      margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Appointment made ',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              fontSize: 12)),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('32',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w900,
                              fontSize: 15)),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('this month',style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 8.0, bottom: 8.0),
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
