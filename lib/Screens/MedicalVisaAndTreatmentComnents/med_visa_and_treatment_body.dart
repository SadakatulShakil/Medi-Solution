import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/country_data.dart';
import 'package:medical_application/Model/countryModel.dart';
import '../../Helper/common_operation.dart';
import '../../language/Languages.dart';
import '../../language/LocalConstant.dart';

class MedicalVisaAndTreatmentBody extends StatefulWidget {
  @override
  _MedicalVisaAndTreatmentBodyState createState() =>
      _MedicalVisaAndTreatmentBodyState();
}

class _MedicalVisaAndTreatmentBodyState
    extends State<MedicalVisaAndTreatmentBody> {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];
  List<CountryModel> countryList = AllCountry;
  List<String> surNameList = [
    'Mr.',
    'Mrs.',
    'Son of',
    'Daughter of',
    'Mister',
  ];
  List<String> nurseServiceList = [
    'Nurse.',
    'Care giver',
    'Medical guide',
    'Baby sitter/Nani',
    'Word boy/brother',
    'Doctor',
  ];
  List<String> workingPlaceList = [
    'Hospital.',
    'Home',
  ];
  bool isEn = true;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    var size = MediaQuery
        .of(context)
        .size;
    var height = size.height;
    var width = size.width;
    final List<Widget> sliderList = carouselImageList
        .map((item) =>
        Container(
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
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: GridView.builder(
                  itemCount: countryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery
                          .of(context)
                          .size
                          .width /
                          (MediaQuery
                              .of(context)
                              .size
                              .height / 2),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    final mCountry = countryList[index];
                    return buildCountry(mCountry);
                  })),
        ),
      ],
    );
  }

  Widget buildCountry(CountryModel mCountry) {
    return GestureDetector(
      onTap: (){
        //card tap
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0, right: 8.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      mCountry.name, style: GoogleFonts.comfortaa(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF848484),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage("assets/images/"+mCountry.image),

                ),
              ),),
          )
          ,
        )
        ,
      ),
    );

  }
}
