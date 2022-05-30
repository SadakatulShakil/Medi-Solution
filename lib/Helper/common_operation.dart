import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../language/Languages.dart';
class CommonOperation {
  static String getDate(String date) {
    String dateTemp = "";
    if (date != null) {
      if (date.isNotEmpty) {
        dateTemp = date.split("T").first;
      }
    }
    return dateTemp;
  }

  static bool isValidMobile(String mobileNumber) {
    bool valid = false;
    if (mobileNumber != null) {
      if (mobileNumber.length > 7) {
        valid = true;
      } else {
        valid = false;
      }
    }
    return valid;
  }

  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  // static callNumber(String phoneNumber) async {
  //   await FlutterPhoneDirectCaller.callNumber(phoneNumber);
  // }

  static commonAppbar() {
    return AppBar(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bolt,
              color: Colors.white,
            ),
            Text('WZPDCL'),
          ]),
      centerTitle: true,
    );
  }

  // static sendEmail(String address) async {
  //   final Email email = Email(
  //     body: 'Email body',
  //     subject: 'Email subject',
  //     recipients: ['customercare@wzpdcl.gov.bd'],
  //     attachmentPaths: ['/path/to/attachment.zip'],
  //     isHTML: false,
  //   );
  //
  //   await FlutterEmailSender.send(email);
  // }

  static showProgressDialog(
      BuildContext context, String text, bool isCancelAble) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: isCancelAble,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static hideProgressDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static bool isEn(BuildContext context) {
    if (Languages.of(context)!.switchLanguage == "English") {
      return false;
    }
    return true;
  }

  static String getBanglaNumber(String number) {
    String banglaNumber = "";

    var numbers = number.split("");

    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] == "0") {
        numbers[i] = "০";
      } else if (numbers[i] == "1") {
        numbers[i] = "১";
      } else if (numbers[i] == "2") {
        numbers[i] = "২";
      } else if (numbers[i] == "3") {
        numbers[i] = "৩";
      } else if (numbers[i] == "4") {
        numbers[i] = "৪";
      } else if (numbers[i] == "5") {
        numbers[i] = "৫";
      } else if (numbers[i] == "6") {
        numbers[i] = "৬";
      } else if (numbers[i] == "7") {
        numbers[i] = "৭";
      } else if (numbers[i] == "8") {
        numbers[i] = "৮";
      } else if (numbers[i] == "9") {
        numbers[i] = "৯";
      }
      banglaNumber = banglaNumber + numbers[i];
    }

    return banglaNumber;
  }

  static String getOtp (){
    int minimum = 100000;
    int maximum = 99999;

    Random random = new Random();
    int randomNumber = minimum + random.nextInt(maximum);
    return randomNumber.toString();
  }


}
