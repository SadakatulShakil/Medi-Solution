import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/med_equipment_data.dart';
import 'package:medical_application/Helper/pharmaceuticals_data.dart';
import 'package:medical_application/Model/medicalEquipmentModel.dart';

import '../../Model/motherAndBabyModel.dart';
import '../../Model/pharmaceuticalsModel.dart';
import '../AllProductScreen.dart';

class MedicalEquipment extends StatefulWidget{
  List<PharmaceuticalModel> pharmaceuticalList;
  List<MedicalEquipmentModel> medicalEquipmentList;
  List<MotherAndBabyModel> motherAndBabyList;
  MedicalEquipment(this.pharmaceuticalList, this.medicalEquipmentList, this.motherAndBabyList);
  @override
  _MedicalEquipmentState createState() => _MedicalEquipmentState();
}
class _MedicalEquipmentState extends State<MedicalEquipment> {
  String from ='medical';
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
              Text('Medical Equipment', style: GoogleFonts.comfortaa(
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
                      widget.medicalEquipmentList.length,
                          (index) => buildMedicalEquipment(widget.medicalEquipmentList[index])
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

}
class buildMedicalEquipment extends StatelessWidget{
  MedicalEquipmentModel medicalEquipmentList;
  buildMedicalEquipment(this.medicalEquipmentList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
      print(medicalEquipmentList.name+'////');
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
                        child: Image.asset(medicalEquipmentList.image),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(medicalEquipmentList.name,style: GoogleFonts.comfortaa(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,) ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(medicalEquipmentList.stock,style: GoogleFonts.comfortaa(
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
                    child: Text(medicalEquipmentList.price,style: GoogleFonts.comfortaa(
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