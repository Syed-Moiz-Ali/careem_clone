import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'constants.dart';
import '../global/global.dart';

class ConnectivityService {
  bool isConnectedShown = false;
  StreamSubscription<bool>? _connectivitySubscription;
  bool isNavigated = false;

  startMonitoring() async {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result.first == ConnectivityResult.none) {
        Aio.scaffoldMessengerKey.currentState?.clearMaterialBanners();
        showNoConnectionSnackbar(false, 'internet not connected',
            Colors.redAccent, AppColors.backgroundColorLight);

        isConnectedShown = false;
        isNavigated = true;
      } else if (result.first == ConnectivityResult.mobile ||
          result.first == ConnectivityResult.wifi) {
        checkInternetAccess();
      }
    });
  }

  Future<void> checkInternetAccess() async {
    _connectivitySubscription?.cancel();
    _connectivitySubscription =
        internetConnectivity().listen((isConnected) async {
      if (!isConnected) {
        showNoConnectionSnackbar(true, 'Connecting...', Colors.redAccent,
            AppColors.backgroundColorLight);
        isConnectedShown = false; // Reset flag when disconnected
      } else if (!isConnectedShown) {
        Aio.scaffoldMessengerKey.currentState?.clearMaterialBanners();
        // showNoConnectionSnackbar(false, 'Connected', tGreen, tWhite);
        await Future.delayed(const Duration(seconds: 1));
        isConnectedShown = true;
        Aio.scaffoldMessengerKey.currentState?.clearMaterialBanners();
      } else {
        Aio.scaffoldMessengerKey.currentState?.clearMaterialBanners();
      }
    });
  }

  Stream<bool> internetConnectivity() async* {
    Aio.scaffoldMessengerKey.currentState?.clearMaterialBanners();
    while (true) {
      await Future.delayed(
          const Duration(seconds: 5)); // Adjust delay as needed
      try {
        final result = await InternetConnection().hasInternetAccess == true;
        yield result;
      } on SocketException catch (_) {
        yield false;
      }
    }
  }

  void showNoConnectionSnackbar(isConnecting, msg, bgColor, txtColor) {
    // final snackbar = SnackBar(
    //   duration: Duration(days: 200),
    //   content: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       if (isConnecting)
    //         SizedBox(
    //           width: 15,
    //           height: 15,
    //           child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(
    //               txtColor, // Use primary color from theme
    //             ),
    //             strokeWidth: 2.0,
    //           ),
    //         ),
    //       const SizedBox(width: 8),
    //       Text(
    //         msg,
    //         style: TextStyle(
    //           color: txtColor,
    //           fontSize: 16.0,
    //           fontWeight: FontWeight.bold, // Add bold font weight
    //         ),
    //       ),
    //     ],
    //   ),
    //   backgroundColor: bgColor, // Background color
    //   behavior: SnackBarBehavior
    //       .floating, // Floating snack bar to ensure it doesn't overlap the AppBar
    // );
    final materialBanner = MaterialBanner(
      content: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isConnecting)
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        txtColor, // Use primary color from theme
                      ),
                      strokeWidth: 2.0,
                    ),
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  msg,
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold, // Add bold font weight
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: bgColor, // Change color as needed

      padding: const EdgeInsets.all(0),

      actions: const [SizedBox.shrink()],
    );
    try {
      Aio.scaffoldMessengerKey.currentState?.showMaterialBanner(materialBanner);
      // Aio.scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
    } catch (e) {
      debugPrint(e.toString());
    }
    // scaffoldMessengerKey.currentState?.;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
