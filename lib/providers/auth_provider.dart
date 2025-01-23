import 'dart:developer';
import 'package:flutter/material.dart';

import '../core/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  bool isNumberValidate = false;
  setIsNumberValidate(bool val) {
    isNumberValidate = val;
    notifyListeners();
  }

  String otp = '';
  setOtp(String val) {
    otp = val;
    notifyListeners();
  }

  Future sendOtp() async {
    try {
      var body = {"phoneNumber": phoneNumberController.text};
      final response = await AuthService.loginUser(body);
      // Handle successful signup, e.g., store token or navigate
      notifyListeners();
      if (response['status'].toString() == '1') {
        // Turf.navigateTo(const OtpScreen());
      }
      return response;
    } catch (error) {
      // Handle error
    }
  }

  Future verifyOtp() async {
    // var provider = Provider.of<UserProvider>(Turf.navigationKey.currentContext!,
    //     listen: false);
    try {
      var body = {"phoneNumber": phoneNumberController.text, "otp": otp};
      final response = await AuthService.verifyOtp(body);
      // Handle successful signup, e.g., store token or navigate
      notifyListeners();
      log("response is $response");
      if (response['status'].toString() == '1') {
        // await provider.setUserDetails(response['user']);
        // await FCMService.updateFCMToken();
        // Turf.navigateTo(response['user']['newUser'].toString() == '1'
        //     ? const PersonalInfoScreen()
        //     : const BottomNavigationScreen());
      }
      return response;
    } catch (error) {
      // Handle error
    }
  }
}
