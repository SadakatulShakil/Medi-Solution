import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../language/Languages.dart';

class OneStopServiceBody extends StatefulWidget{
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];

  @override
  _OneStopServiceBodyState createState() => _OneStopServiceBodyState();

}

class _OneStopServiceBodyState extends State<OneStopServiceBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    final List<Widget> sliderList =
    widget.carouselImageList.map((item) =>
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
        SizedBox(height: 10,),
        CarouselSlider(items: sliderList, options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0
        )),
        SizedBox(height: 50,),
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
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0, right: 25),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.add_ic_call_rounded,
                      size: 15,
                      color: Color(0xFF000000),),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Dial for help', style: GoogleFonts.comfortaa(
                        color: const Color(0xFF000000),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 25.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                height: 150.0,
                child: SizedBox.fromSize(
                  size: Size(150, 150), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Color(0xFF62A564), // button color
                      child: InkWell(
                        splashColor: Color(0xFFFFFFFF),
                        // splash color
                        onTap: () {

                        },
                        // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.video_call_outlined,
                              size: 75.0,
                              color: Colors.white,
                            ), // icon
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  'Video call',
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 20.0,
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                height: 150.0,
                child: SizedBox.fromSize(
                  size: Size(150, 150), // button width and height
                  child: ClipOval(
                    child: Material(
                      color: Color(0xFF0274A8), // button color
                      child: InkWell(
                        splashColor: Color(0xFFFFFFFF),
                        // splash color
                        onTap: () {},
                        // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.add_call,
                              size: 55.0,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8.0,),// icon
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                  'Audio cal',
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}