import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../widgets/custom_toast.dart';
import '../constants/api_constants.dart';
import '../global/global.dart';

class ApiService {
  static Future<dynamic> request({
    required String url,
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? queryParams, // Added queryParams
    bool useToken = false,
    bool saveToken = false,
    String type = 'POST', // Changed to default to POST for sending OTP
  }) async {
    // Build the URI with query parameters if provided
    final uri = Uri.parse(ApiConstants.baseUrl + url)
        .replace(queryParameters: queryParams);

    var req = http.Request(type.toUpperCase(), uri);

    var pref = Aio.pref!;
    Map<String, String> headers = {
      "Content-Type": "application/json", // Ensure the Content-Type is set
    };

    // Add token if required
    if (useToken) {
      var userDetails = pref.getString('userDetails');
      if (userDetails != null) {
        var jsonData = json.decode(userDetails);
        var token = jsonData['user']?['token'];
        if (token != null) {
          log(token);
          headers['authorization'] = "Bearer $token";
        }
      }
    }

    log('Request URL: ${uri.toString()}');
    log('Request Type: $type');
    log('Request Body: ${json.encode(body)}');

    req.headers.addAll(headers);
    req.body = json.encode(body);

    // Connectivity check
    var connectivityResult = await Connectivity().checkConnectivity();
    while (connectivityResult.contains(ConnectivityResult.none)) {
      await Future.delayed(const Duration(seconds: 2));
      connectivityResult = await Connectivity().checkConnectivity();
    }

    try {
      // Send the request
      var res = await req.send();
      final resBody = await res.stream.bytesToString();
      log('Response Body: $resBody');

      if (res.statusCode >= 200 && res.statusCode < 300) {
        var data = json.decode(resBody);

        if (saveToken && data['user'] != null) {
          await pref.setString('userDetails', json.encode(data));
        }

        if (data['status'].toString() == '1' && data['message'] != null) {
          CustomToast.show(message: data['message'], type: ToastType.success);
        }

        return data;
      } else {
        var errorData = json.decode(resBody);
        CustomToast.show(message: errorData['message'], type: ToastType.error);
        throw Exception('Error: ${errorData['message'] ?? res.reasonPhrase}');
      }
    } catch (error) {
      // Provide more informative error messages
      log('Request failed: $error');
      // CustomToast.show(message: error.toString(), type: ToastType.error);
      throw Exception('Request failed: ${error.toString()}');
    }
  }
}
