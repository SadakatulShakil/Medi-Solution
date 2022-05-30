import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_application/Helper/pathology_test_data.dart';
import 'package:medical_application/Model/pathologyDataModel.dart';
import 'package:medical_application/Screens/DLabAndPathologyComponents/labHospitalListBody.dart';
import 'package:medical_application/Screens/DLabAndPathologyComponents/lab_test_booking.dart';

import '../../Helper/labHospital_data.dart';
import '../../Model/labHospitalModel.dart';
import '../../language/Languages.dart';

class DLabAndPathologyBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();
}
class InitState extends State<DLabAndPathologyBody> {
  List<PathologyDataModel> pathologyDataList = AllPathologyData;
  List<LabHospitalModel> labHospitalList = AllLabHospital;
  String from = 'lab';
  String FileName = 'File name';
  String filePath = "";
  File? image;
  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final tempImage = File(image.path);
      filePath = image.path
          .split('/')
          .last;
      setState(() {
        Navigator.of(context).pop();
        this.image = tempImage;
        this.FileName = filePath;
      });
    }on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

  Future captureImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final tempImage = File(image.path);
      filePath = image.path
          .split('/')
          .last;
      setState(() {
        Navigator.of(context).pop();
        this.image = tempImage;
        this.FileName = filePath;
      });
    }on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }
  @override
  void initState() {
    super.initState();

    //widget.hospitalList = AllHospital;
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(pathologyDataList,labHospitalList);
  }

  Widget initWidget(List<PathologyDataModel> pathologyDataList, List<LabHospitalModel> labHospitalList) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: (){
              if (kDebugMode) {
                print('oneStopCall: '+'working');
              }
              var snackBar = const SnackBar(content: Text('OneStop Service is Under processing!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 15),
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.add_ic_call_rounded,
                        size: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'OneStop Service', style: GoogleFonts.comfortaa(
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
          SizedBox(height: 8,),
          // image upload option here
          InkWell(
            onTap: ()async{
              dialog();
              print("dialog");
            },
            child: Container(
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: image == null?Image.asset('assets/images/upload_icon.jpg'):Image.file(image!)),
            ),
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 12.0, top: 5.0, bottom: 5.0, right: 15.0),
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            // changes position of shadow
                          ),
                        ],
                      ),
                      child:  Text(FileName, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.bold,) ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15.0),
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF01A9B8),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child:  Text(Languages.of(context)!.continueBtn, textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,) ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('Test list :', textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,) ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: ListView.builder(
                    itemCount: pathologyDataList.length,
                    itemBuilder: (context, index) {
                      final mPathologyData = pathologyDataList[index];

                      return buildPathologyData(mPathologyData, from);
                    }
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPathologyData(PathologyDataModel mPathologyData, String from)=>
    InkWell(
      onTap: (){
        print(mPathologyData.testName+'///');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LabHospitalListBody(labHospitalList, mPathologyData, from)));
      },
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        mPathologyData.testName,style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        mPathologyData.testDescription,style: GoogleFonts.comfortaa(
                      color: Colors.grey,
                    ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 12.0),
                    child:  Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.discount_outlined,
                              size: 15,
                              color: const Color(0xFF00A6FF)),
                          Text(
                            'View hospital list', style: GoogleFonts.comfortaa(
                            color: const Color(0xFF00A6FF),
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                        ]
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );

  void dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: Text('Please select operation',style: GoogleFonts.comfortaa(
                    color: const Color(0xFF000000),
                    fontSize: 18
                  )))
                ]),
            //content: Text("Are You Sure Want To Proceed?"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()async{
                        captureImage();
                      },
                      child: Container(
                        child: Column(
                  //captureImage();
                          children: [
                            Image.asset('assets/images/camera.png', width: 40,height: 40),
                            SizedBox(height: 8.0,),
                            Text('Camera',style: GoogleFonts.comfortaa(
                              color: const Color(0xFF000000),
                            )),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ()async{
                        pickImage();
                      },
                      child: Container(
                        child: Column(
                          //captureImage();
                          children: [
                            Image.asset('assets/images/photos.png', width: 40,height: 40),
                            SizedBox(height: 8.0,),
                            Text('Gallery',style: GoogleFonts.comfortaa(
                              color: const Color(0xFF000000),
                            )),
                          ],
                        ),
                      ),
                    ),
                    // FlatButton(
                    //   child: Icon(
                    //     Icons.clear,
                    //     size: 30.0,
                    //     color: Color(0xFFE51010),
                    //   ),
                    //   onPressed: () {
                    //     //Put your code here which you want to execute on Yes button click.
                    //     Navigator.of(context).pop();
                    //   },
                    // ),
                  ],
                ),
              )
            ],
          );
        });
  }


}
