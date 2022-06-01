import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/med_equipment_data.dart';
import 'package:medical_application/Helper/mother_baby_data.dart';
import 'package:medical_application/Helper/pharmaceuticals_data.dart';
import 'package:medical_application/Model/medicalEquipmentModel.dart';
import 'package:medical_application/Model/motherAndBabyModel.dart';
import 'package:medical_application/Model/pharmaceuticalsModel.dart';
import '../Helper/search_widget.dart';
import 'PharmaceuticalAndMedEquipmentComponents/pharma_and_med_body.dart';

class AllProductsScreen extends StatefulWidget {
  String from;
  List<PharmaceuticalModel> pharmaceuticalList;
  List<MedicalEquipmentModel> medicalEquipmentList;
  List<MotherAndBabyModel> motherAndBabyList;

  AllProductsScreen(this.from, this.pharmaceuticalList,
      this.medicalEquipmentList, this.motherAndBabyList);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<AllProductsScreen> {
  String query = '';

  @override
  void initState() {
    super.initState();
    widget.pharmaceuticalList = AllPharmaceuticals;
    widget.medicalEquipmentList = AllMedEquipments;
    widget.motherAndBabyList = AllMotherBabyData;
    print('From '+ widget.from+'////'+'length1 '+widget.pharmaceuticalList.length.toString()
        +'////'+'length2 '+widget.motherAndBabyList.length.toString()+'////'+'length3 '+widget.medicalEquipmentList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context, widget.pharmaceuticalList, widget.motherAndBabyList, widget.medicalEquipmentList);
  }

  Widget initWidget(BuildContext context, List<PharmaceuticalModel> pharmaceuticalList, List<MotherAndBabyModel> motherAndBabyList, List<MedicalEquipmentModel> medicalEquipmentList) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A6FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
            widget.from == 'pharma'
                ? 'Pharmaceuticals'
                : widget.from == 'mother'
                    ? 'Mother & baby'
                    : 'Medical Equipment',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900,
                fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.from == 'pharma' ?
            Column(
              children: [
                buildSearch(),
                Expanded(
                  child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: pharmaceuticalList.length,
                  itemBuilder: (BuildContext context, index) {
                    final mP = pharmaceuticalList[index];
                    return buildPharma(mP);
                  }),
                ),
              ],
            ):
            widget.from == 'mother' ?
            Column(
              children: [
                buildSearch1(),
                Expanded(
                  child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: widget.motherAndBabyList.length,
                  itemBuilder: (BuildContext context, index) {
                    final mP1 = widget.motherAndBabyList[index];
                    return buildMother(mP1);
                  }),
                ),
              ],
            ):
            Column(
              children: [
                buildSearch2(),
                Expanded(
                  child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: widget.medicalEquipmentList.length,
                  itemBuilder: (BuildContext context, index) {
                    final mP2 = widget.medicalEquipmentList[index];
                    return buildMedical(mP2);
                  }),
                ),
              ],
            ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      onChanged: searchProduct,
      hintText: 'search by product name');
  Widget buildSearch1() => SearchWidget(
      text: query,
      onChanged: searchProduct1,
      hintText: 'search by product name');
  Widget buildSearch2() => SearchWidget(
      text: query,
      onChanged: searchProduct2,
      hintText: 'search by product name');

  void searchProduct(String query) {
    final pharmaceuticalList = AllPharmaceuticals.where((mP) {
      final nameLower = mP.name.toLowerCase();
      //final nameLower = mDoctor.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      widget.pharmaceuticalList = pharmaceuticalList;
    });
  }
  void searchProduct1(String query) {
    final motherAndBabyList = AllMotherBabyData.where((mP1) {
      final nameLower = mP1.name.toLowerCase();
      //final nameLower = mDoctor.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      widget.motherAndBabyList = motherAndBabyList;
    });
  }
  void searchProduct2(String query) {
    final medicalEquipmentList = AllMedEquipments.where((mP2) {
      final nameLower = mP2.name.toLowerCase();
      //final nameLower = mDoctor.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      widget.medicalEquipmentList = medicalEquipmentList;
    });
  }

  Widget buildPharma(PharmaceuticalModel mP) =>
      Container(
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
                        child: Image.asset(mP
                            .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP.stock,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP.price,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF01A9B8),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
      );
  Widget buildMother(MotherAndBabyModel mP1) =>
      Container(
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
                        child: Image.asset(mP1
                            .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP1
                          .name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP1
                          .stock,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP1
                          .price,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF01A9B8),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
      );
  Widget buildMedical(MedicalEquipmentModel mP2) =>
      Container(
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
                        child: Image.asset(mP2
                            .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP2
                          .name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 2.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP2
                          .stock,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(mP2
                          .price,
                          maxLines: 1,
                          style: GoogleFonts.comfortaa(
                            color: const Color(0xFF01A9B8),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
      );
}
