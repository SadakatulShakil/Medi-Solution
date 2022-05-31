import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/Helper/pharmaceuticals_data.dart';
import 'package:medical_application/Model/pharmaceuticalsModel.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/departmentHoldingPage.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/doctorHoldingPage.dart';
import 'package:medical_application/Screens/DoctorApointmentComponents/hospitalHoldingPage.dart';

class DepartmentHolding extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<DepartmentHolding> {
  List<PharmaceuticalModel> pharmaceuticalList = AllPharmaceuticals;
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color(0xFF00A6FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Department List',
            style: GoogleFonts.comfortaa(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          List.generate(
              pharmaceuticalList.length,
                  (index) =>
                  categoryDataListCard(
                      preview: pharmaceuticalList[index].image,
                      label: pharmaceuticalList[index].name,
                      volume: pharmaceuticalList[index].stock,
                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorHolding()));

                      }
                  )
          )
      ),
    ),
    );
  }

}
class categoryDataListCard extends StatelessWidget {
  const categoryDataListCard({
    Key? key,
    required this.preview,
    required this.label,
    required this.volume,
    required this.press,
  }) : super(key: key);

  final String? preview, label, volume;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(left:12, bottom: 5.0, right: 12.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: width,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE7EAEC),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Department name', style: GoogleFonts.comfortaa(
                          color: const Color(0xFF000000),
                          fontSize: 15,
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
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      image: AssetImage(preview!),

                    ),
                  ),),
              ],
            ),
          )
          ,
        )
        ,
      ),
    );
  }
}
