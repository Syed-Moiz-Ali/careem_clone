import 'dart:developer';

import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_textfiled.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:careem/providers/auth_provider.dart';
import 'package:careem/screens/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/common/common_widgets.dart';
import '../../core/enums/app_enums.dart';
import '../../core/widgets/custom_padding.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AuthProvider>();
    log("this sis s ${provider.phoneNumberController.text.length}");
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: '',
        // prefixIcon: Aio.navigationBackIcon(),
        automaticallyImplyLeading: true,

        actions: [
          CommonWidgets.customAppBarIcon(
            icon: Icons.headset_mic_sharp,
            opTap: () {
              // NH.navigateBack();
            },
          ),
        ],
      ),
      body: CustomPadding(
        horizontalFactor: .03,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomGap(heightFactor: .04),
            const TextWidget(
              text: 'Welcome!',
              styleType: TextStyleType.heading,
            ),
            const TextWidget(
              text: "What's your number?",
              styleType: TextStyleType.heading,
            ),
            const CustomGap(heightFactor: .01),
            const TextWidget(
              text: "we need to send you a code to verify your phone number",
              color: AppColors.greyColor,
            ),
            const CustomGap(heightFactor: .03),
            CustomTextField(
                labelText: provider.phoneNumberController.text.isNotEmpty
                    ? 'Phone Number'
                    : '',
                onChanged: (value) {
                  if (value.length >= 10) {
                    provider.setIsNumberValidate(true);
                  } else {
                    provider.setIsNumberValidate(false);
                  }
                },
                maxLength: 10,
                keyboardType: TextInputType.phone,
                prefixIcon: const CustomPadding(
                    allSidesFactor: .02, child: TextWidget(text: '+91')),
                controller: provider.phoneNumberController,
                hintText: '0123456789')
          ],
        ),
      ),
      floatingActionButton: PrimaryButton(
        elevation: 0,
        onTap: provider.isNumberValidate
            ? () {
                NH.navigateTo(const OtpScreen());
              }
            : () {},
        text: 'Continue',
        textColor: provider.isNumberValidate
            ? null
            : AppColors.backgroundColorDark.withOpacity(.7),
        fontWeight: FontWeight.w700,
        width: .9,
        borderRadius: 100,
        bgColor: provider.isNumberValidate ? null : AppColors.disabledColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
