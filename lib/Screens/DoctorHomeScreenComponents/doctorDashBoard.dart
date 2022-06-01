import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medical_application/Screens/DoctorHomeScreenComponents/doctor_home_page.dart';

import '../OneStopServiceComponents/one_stop_service_body.dart';
import '../doctor_time_slot_page.dart';
import '../doctor_appointment_page.dart';
import '../doctor_profile_page.dart';

class DoctorDashBoard extends StatefulWidget{
  @override
  State<DoctorDashBoard> createState() => _DoctorDashBoardState();
}
class _DoctorDashBoardState extends State<DoctorDashBoard> {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];
  int _currentIndex = 0;
  final screens = [
    DoctorHomePage(),
    DoctorTimeSlotPage(),
    DoctorAppointmentPage(),
    DoctorProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Color(0xFF01A9B8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 5,
            curve: Curves.easeInCubic,
            backgroundColor: Color(0xFF01A9B8),
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            onTabChange: (index){
              _changeTab(index);
            },
            padding: EdgeInsets.all(8.0),
            tabs: [
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.calendar_today_outlined, text: 'Slot'),
              GButton(icon: Icons.format_list_bulleted_outlined, text: 'List'),
              GButton(icon: Icons.person, text: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}

