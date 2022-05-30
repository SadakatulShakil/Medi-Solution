import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
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
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: widget.from == 'pharma'
                      ? widget.pharmaceuticalList.length
                      : widget.from == 'mother'
                          ? widget.motherAndBabyList.length
                          : widget.medicalEquipmentList.length,
                  itemBuilder: (BuildContext ctx, index) {
                  final mP = widget.pharmaceuticalList[index];
                    return Container(
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
                                        child: Image.asset(widget.from == 'pharma'
                                    ? widget.pharmaceuticalList[index].image
                                    : widget.from == 'mother'
                                    ? widget.motherAndBabyList[index].image
                                    : widget.medicalEquipmentList[index].image,
                                    fit: BoxFit.cover),
                                  ),
                                ),
                            ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.from == 'pharma'
                                        ? widget.pharmaceuticalList[index].name
                                        : widget.from == 'mother'
                                        ? widget.motherAndBabyList[index].name
                                        : widget.medicalEquipmentList[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.comfortaa(
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.bold,) ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.from == 'pharma'
                                        ? widget.pharmaceuticalList[index].stock
                                        : widget.from == 'mother'
                                        ? widget.motherAndBabyList[index].stock
                                        : widget.medicalEquipmentList[index].stock,
                                        maxLines: 1,
                                        style: GoogleFonts.comfortaa(
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w900,) ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(widget.from == 'pharma'
                                        ? widget.pharmaceuticalList[index].price
                                        : widget.from == 'mother'
                                        ? widget.motherAndBabyList[index].price
                                        : widget.medicalEquipmentList[index].price,
                                        maxLines: 1,
                                        style: GoogleFonts.comfortaa(
                                      color: const Color(0xFF01A9B8),
                                      fontWeight: FontWeight.bold,
                                    ) ),
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

                  }),
            ),
          ),
        ],
      ),

    );
  }
  Widget buildSearch() =>
      SearchWidget(
          text: query,
          onChanged: searchProduct,
          hintText: 'doctor name, department or hospital'
      );

  void searchProduct(String query) {
    final pharmaceuticalList = widget.pharmaceuticalList.where((mP) {
      final nameLower = mP.name.toLowerCase();
      //final nameLower = mDoctor.designation.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }
    ).toList();

    setState(() {
      this.query = query;
      widget.pharmaceuticalList = pharmaceuticalList;
    });
  }

}
