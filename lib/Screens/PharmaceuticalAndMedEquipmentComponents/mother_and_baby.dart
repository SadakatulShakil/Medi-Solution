import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/mother_baby_data.dart';
import 'package:medical_application/Helper/pharmaceuticals_data.dart';
import 'package:medical_application/Model/motherAndBabyModel.dart';

import '../../Model/medicalEquipmentModel.dart';
import '../../Model/pharmaceuticalsModel.dart';
import '../AllProductScreen.dart';

class MotherAndBaby extends StatefulWidget{
  List<PharmaceuticalModel> pharmaceuticalList;
  List<MedicalEquipmentModel> medicalEquipmentList;
  List<MotherAndBabyModel> motherAndBabyList;
  MotherAndBaby(this.pharmaceuticalList, this.medicalEquipmentList, this.motherAndBabyList);
  @override
  _MotherAndBabyState createState() => _MotherAndBabyState();
}
class _MotherAndBabyState extends State<MotherAndBaby> {
  String from ='mother';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.0, right: 15.0, top: 15.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mother & Baby care', style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
              )
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductsScreen(
                      from,
                      widget.pharmaceuticalList, widget.medicalEquipmentList,
                      widget.motherAndBabyList
                  )));
                },
                child: Text('View all', style: GoogleFonts.comfortaa(
                  color: const Color(0xFF00A6FF),
                  fontWeight: FontWeight.bold,
                )
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  List.generate(
                      widget.motherAndBabyList.length,
                          (index) => buildMotherAndBaby(widget.motherAndBabyList[index])
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

}
class buildMotherAndBaby extends StatelessWidget{
  MotherAndBabyModel motherAndBabyList;
  buildMotherAndBaby(this.motherAndBabyList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print(motherAndBabyList.name+'////');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0, right: 8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 160,
            child: Column(
              children: [
                Container(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FittedBox(
                        child: Image.asset(motherAndBabyList.image),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(motherAndBabyList.name,style: GoogleFonts.comfortaa(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,) ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(motherAndBabyList.stock,style: GoogleFonts.comfortaa(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w900,) ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 3.0, bottom: 5.0),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //       child: Image.asset(rating!)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(motherAndBabyList.price,style: GoogleFonts.comfortaa(
                      color: const Color(0xFF01A9B8),
                      fontWeight: FontWeight.bold,) ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}