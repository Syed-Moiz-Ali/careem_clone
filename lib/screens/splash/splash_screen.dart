import 'dart:developer';

import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/global/global.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/screens/auth/phone_number_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomImageWidget(
            width: Aio.size.width,
            height: Aio.size.height,
            imageUrl:
                'https://images.pexels.com/photos/12438890/pexels-photo-12438890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.backgroundColorDark.withOpacity(.5),
                      AppColors.backgroundColorDark.withOpacity(.1)
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            width: Aio.size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: CustomPadding(
                allSidesFactor: .04,
                child: Column(
                  children: [
                    PrimaryButton(
                      onTap: () {
                        log('this is hitted');
                        NH.navigateTo(const PhoneNumberScreen());
                      },
                      text: 'Continue with phone number',
                      borderRadius: Aio.size.width,
                      textColor: AppColors.backgroundColorDark,
                      fontWeight: FontWeight.w700,
                      height: .075,
                    ),
                    const CustomGap(heightFactor: .007),
                    PrimaryButton(
                      border: BorderSide(
                          color: AppColors.disabledColor.withOpacity(.1),
                          width: 3),
                      elevation: 0,
                      onTap: () {},
                      text: 'Continue with google',
                      borderRadius: Aio.size.width,
                      height: .075,
                      bgColor: AppColors.backgroundColorLight,
                      textColor: AppColors.backgroundColorDark,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
