import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }
  String get switchLanguage;
  String get RateApp;
  String get language_toggle;
  String get doctorAppointment;
  String get hospitalAdmission;
  String get dLabAndPathology;
  String get ambulanceService;
  String get physiotherapyService;
  String get trainingAndWorkshop;
  String get nursingAndGuide;
  String get medicalVisaAndTreatment;
  String get pharmacyAndMedicalEquipment;
  String get oneStopService;
  String get forDoctor;
  String get menuHome;
  String get menuProfile;
  String get menuSettings;
  String get menuLogout;
  String get appBarDocAppointment;
  String get appBarHospitalAdmission;
  String get appBarAmbulanceService;
  String get appBarDLabService;
  String get oneStop;
  String get onlineDoctor;
  String get offlineDoctor;
  String get searchLocationHint;
  String get bookingForm;
  String get choosePatientCriteria;
  String get general;
  String get emergency;
  String get patientNameHint;
  String get patientNameLabel;
  String get careOfHint;
  String get careOfLabel;
  String get ageHint;
  String get ageLabel;
  String get currentLocationHint;
  String get currentLocationLabel;
  String get presentAddressHint;
  String get presentAddressLabel;
  String get problemSummeryHint;
  String get problemSummeryLabel;
  String get admissionDate;
  String get admissionDateHint;
  String get sex;
  String get radioMale;
  String get radioFemale;
  String get radioOther;
  String get cabinCriteriaHint;
  String get incentiveCare;
  String get emergencyContactHint;
  String get emergencyContactLabel;
  String get optionalContactHint;
  String get optionalContactLabel;
  String get continueBtn;
  String get destinationLabel;
  String get destinationHint;
  String get ambulanceCriteriaHint;
  String get chooseDoctorOption;
  String get radioWithDoc;
  String get radioWithOutDoc;
  String get chooseWordBoyOption;
  String get radioWithBoy;
  String get radioWithOutBoy;
  String get price;
  String get discount;
  String get advanceBooking;
}
