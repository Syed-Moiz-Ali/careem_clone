// ignore_for_file: unused_element

import 'package:careem/core/common/top_sheet_widget.dart';
import 'package:careem/core/global/global.dart';
import 'package:careem/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';
import 'core/constants/constants.dart';
import 'core/localization/supported_languages.dart';
// import 'modules/shop/groceries/screens/groceries_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/sliding_container_provider.dart';
import 'screens/home/home_screen.dart'; // Import the new provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Aio.initializePref();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()..initializeTheme()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(
          create: (_) => SlidingContainerProvider()), // Add the provider
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Set up the controller for the SlidingContainerProvider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SlidingContainerProvider>(context, listen: false)
          .setController(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    // var slidingContainerProvider = context.watch<SlidingContainerProvider>();
    // log('slidingContainerProvider.isContainerVisible is ${slidingContainerProvider.isContainerVisible}');
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return ToastificationWrapper(
            child: ResponsiveSizer(
              builder: (context, orientation, type) {
                return MaterialApp(
                  supportedLocales: SupportedLanguages.supportedLocales,
                  navigatorKey: Aio.navigationKey,
                  scaffoldMessengerKey: Aio.scaffoldMessengerKey,
                  title: 'Careem',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  themeMode: themeProvider.theme,
                  darkTheme: AppTheme.darkTheme,
                  builder: (context, child) {
                    return topSheetWidget(child!, context);
                  },
                  home: const HomeScreen(),
                  // home: const SplashScreen(),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Widget _topSheetWidget(Widget? child) {
  //   var slidingContainerProvider = context.watch<SlidingContainerProvider>();

  //   return Stack(
  //     children: [
  //       child!, // Main content behind the sliding container

  //       // Overlay to dismiss the container by tapping outside
  //       if (slidingContainerProvider.isContainerVisible)
  //         Positioned(
  //           top: 0,
  //           left: 0,
  //           right: 0,
  //           child: GestureDetector(
  //             onTap: () {
  //               slidingContainerProvider
  //                   .toggleContainer(); // Dismiss the container when tapped
  //             },
  //             child: Container(
  //               height: 100.h,
  //               width: 100.w,
  //               color: Colors.black.withOpacity(0.5), // Transparent overlay
  //             ),
  //           ),
  //         ),

  //       // Sliding container itself
  //       if (slidingContainerProvider.isContainerVisible)
  //         Positioned(
  //           top: 0,
  //           left: 0,
  //           right: 0,
  //           child: AnimatedBuilder(
  //             animation: slidingContainerProvider.slideAnimation,
  //             builder: (context, child) {
  //               return Transform.translate(
  //                 offset: slidingContainerProvider.slideAnimation.value,
  //                 child: child,
  //               );
  //             },
  //             child: SizedBox(
  //               height: 30.h, // Height of the sliding container
  //               child: const AppMenu(), // Replace with your actual widget
  //             ),
  //           ),
  //         ),
  //     ],
  //   );
  // }
}
