import '../constants/api_constants.dart';

import 'api_service.dart';

class AuthService {
  static Future loginUser(Map<String, dynamic> body) async {
    const url = ApiConstants.sendOtp;
    // final body = {"phoneNumber": phoneNumber, "otp": otp};

    try {
      final response =
          await ApiService.request(url: url, type: 'post', body: body);
      return response;
    } catch (error) {
      return error;
    }
  }

  static Future verifyOtp(Map<String, dynamic> body) async {
    const url = ApiConstants.verifyOtp;
    // final body = {"phoneNumber": phoneNumber, "otp": otp};

    try {
      final response = await ApiService.request(
          url: url, type: 'post', body: body, saveToken: true);
      return response;
    } catch (error) {
      return error;
    }
  }
}
