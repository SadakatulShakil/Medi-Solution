import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medical_application/Screens/PharmaceuticalAndMedEquipmentComponents/pharmaceuticals.dart';

import '../../Helper/common_operation.dart';
import '../../Helper/med_equipment_data.dart';
import '../../Helper/mother_baby_data.dart';
import '../../Helper/pharmaceuticals_data.dart';
import '../../Model/medicalEquipmentModel.dart';
import '../../Model/motherAndBabyModel.dart';
import '../../Model/pharmaceuticalsModel.dart';
import '../../language/Languages.dart';
import 'medical_equipment.dart';
import 'mother_and_baby.dart';

class PharmaceuticalAndMedEquipmentBody extends StatefulWidget {
  List<String> sliderImage;

  PharmaceuticalAndMedEquipmentBody(this.sliderImage);

  @override
  _PharmaceuticalAndMedEquipmentBodyState createState() =>
      _PharmaceuticalAndMedEquipmentBodyState();
}

class _PharmaceuticalAndMedEquipmentBodyState
    extends State<PharmaceuticalAndMedEquipmentBody> {
  bool isEn = true;
  List<PharmaceuticalModel> pharmaceuticalList = AllPharmaceuticals;
  List<MedicalEquipmentModel> medicalEquipmentList = AllMedEquipments;
  List<MotherAndBabyModel> motherAndBabyList = AllMotherBabyData;
  @override
  void initState() {
    setState(() {});
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final List<Widget> sliderList = widget.sliderImage
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            Languages.of(context)!.oneStop,
                            style: GoogleFonts.comfortaa(
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
              height: 10,
            ),
            Pharmaceuticals(pharmaceuticalList, medicalEquipmentList, motherAndBabyList),
            SizedBox(
              height: 10,
            ),
            MedicalEquipment(pharmaceuticalList, medicalEquipmentList, motherAndBabyList),
            SizedBox(
              height: 10,
            ),
            MotherAndBaby(pharmaceuticalList, medicalEquipmentList, motherAndBabyList),
          ],
        ),
      ),
    );
  }
}
