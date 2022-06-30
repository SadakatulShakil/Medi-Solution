import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_application/ThemeProvider/theme_provider.dart';
import 'package:medical_application/main.dart';
import 'package:provider/provider.dart';

import '../language/Languages.dart';
import '../language/LocalConstant.dart';
import 'HomeComponents/body.dart';
enum PopUpNavMenu {
  SwitchToBangla,
  RateThisApp
}
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HomeScreen> {
  //List<Member> memberList = Utils.getDataCollection();
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xFF0274A8),
            ),
          ),
          SafeArea(
              child: Container(
                width: 200.0,
                padding: EdgeInsets.only(top: 18.0, left: 8.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/user.png",
                          width: 80.0,
                          height: 80.0,
                        ),
                        SizedBox(height: 10,),
                        Text('Shakil ajam',
                            style: GoogleFonts.comfortaa(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    const Text(
                      '-------------------------------------',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () {
                              setState(() {
                                value = 0;
                              });
                            },
                            leading: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.menuHome,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.menuProfile,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              if(Languages.of(context)!.switchLanguage == "English"){
                                changeLanguage(context, 'en');
                              }else{
                                changeLanguage(context, 'bn');
                              }
                            },
                            leading: const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.switchLanguage,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.menuSettings,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.menuLogout,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text(
                              Languages.of(context)!.RateApp,
                              style: GoogleFonts.comfortaa(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),

          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 350),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 160 * val)
                    ..rotateY((pi / 6) * val),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(value == 1? 20:0),
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: const Color(0xFF00A6FF),
                        title: Image.asset("assets/icons/icon.png",fit: BoxFit.cover,),
                        centerTitle: true,
                        leading: IconButton(
                          icon: Image.asset("assets/icons/menu_icon.png",fit: BoxFit.cover,),
                          onPressed: (){
                            setState(() {
                              value == 0? value = 1: value = 0;
                              //value == 1? value = 0: value = 1;
                            });
                          },
                        ),
                        actions: [
                          ///Darmode option here
                          IconButton(
                              icon: Icon(
                                  Get.isDarkMode?
                                  Icons.light_mode :
                                  Icons.nights_stay_outlined),

                              onPressed: () {
                                Get.isDarkMode
                                    ? Get.changeTheme(ThemeData.light())
                                    : Get.changeTheme(ThemeData.dark());
                                // MyApp2.themeNotifier.value =
                                // MyApp2.themeNotifier.value == ThemeMode.light
                                //     ? ThemeMode.dark
                                //     : ThemeMode.light;
                                // setState(() {
                                //
                                // });
                              }
                              )
                        ],
                      ),
                      body: Body(),
                    ),
                  ),
                ));
              }),
        ],
      ),
    );
  }

  void choiceAction(context, choice) async{
    if (PopUpNavMenu.SwitchToBangla == choice) {
      print('SwitchToBangla');

      if(Languages.of(context)!.switchLanguage == "English"){
        changeLanguage(context, 'en');
      }else{
        changeLanguage(context, 'bn');
      }

    }else if(PopUpNavMenu.RateThisApp == choice){
      ///Do logic for NoticeBoard page
    }
  }

  Widget menuItem(String text, String assetName) {
    // TODO: Change the shape
    return Container(
        width: 500,
        child: Row(children: [
          SvgPicture.asset('vectors/$assetName',height: 20, width: 20,),
          SizedBox(
            width: 24.08,
          ),
          Text(text),
        ]));
  }

}
