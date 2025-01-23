// ignore_for_file: library_private_types_in_public_api

import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/constants.dart';
import '../../core/enums/app_enums.dart';
import '../../core/utils/provider_util/provider_helper.dart';
import '../../core/widgets/custom_gap.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/text_widget.dart';
import '../../providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'userprofile_setup.dart';
// import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  bool isLoading = false;
  bool showVerifyBtn = false;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = ProviderHelper.read.authProvider();
    final theme = Theme.of(context);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:
          TextStyle(fontSize: 22, color: theme.textTheme.bodyLarge!.color),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColorLight,
        // borderRadius: BorderRadius.circular(6),
        border: Border(
            bottom: BorderSide(color: AppColors.backgroundColorDark, width: 2)),
        // border: Border.all(
        //   color: theme.colorScheme.onSurface.withOpacity(.6),
        // ),
        // boxShadow: [AppColors.shadow]
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          automaticallyImplyLeading: true,
          title: '',
          prefixIcon: CommonWidgets.navigationBackIcon(),
          actions: [
            CommonWidgets.customAppBarIcon(
              icon: Icons.headset_mic_sharp,
              opTap: () {
                // NH.navigateBack();
              },
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: CustomPadding(
            allSidesFactor: .03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomGap(heightFactor: .01),
                TextWidget(
                  text: 'otp_title',
                  styleType: TextStyleType.heading,
                  textAlign: TextAlign.center,
                  fontSize: 20.sp,
                  maxLine: 2,
                ),
                const CustomGap(heightFactor: .01),
                _buildOtpDescription(provider),
                const CustomGap(heightFactor: .02),
                SizedBox(
                    width: 100.w,
                    child: _buildOtpPinInput(defaultPinTheme, theme)),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildVerifyButton());
  }

  // Builds the OTP description with dynamic phone number
  Widget _buildOtpDescription(AuthProvider provider) {
    return TextWidget(
      text: 'otp_dis',
      // namedArgs: {'phoneNumber': provider.phoneNumberController.text},
      textAlign: TextAlign.center,
      color: AppColors.backgroundColorDark.withOpacity(.6),
      fontSize: 14.sp,
      maxLine: 3,
    );
  }

  // Builds the OTP input field (Pinput)
  Widget _buildOtpPinInput(PinTheme defaultPinTheme, ThemeData theme) {
    return Pinput(
      controller: pinController,
      length: 4,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => SizedBox(width: 0.w),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      validator: (value) => value!.isEmpty ? 'Pin is required' : null,
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
      onChanged: (value) {
        setState(() {
          showVerifyBtn = value.length == 4;
        });
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 2,
            height: 30,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          // borderRadius: BorderRadius.circular(12),
          border:
              Border(bottom: BorderSide(color: theme.primaryColor, width: 2)),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          // borderRadius: BorderRadius.circular(12),
          border:
              Border(bottom: BorderSide(color: theme.primaryColor, width: 2)),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: AppColors.errorColor),
      ),
    );
  }

  // Builds the "Didn’t receive code? Resend" row
  Widget _buildResendCodeRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
            text: 'otp_notice',
          ),
          const CustomGap(widthFactor: .008),
          GestureDetector(
            onTap: () {
              // Resend OTP logic
            },
            child: const TextWidget(
              text: 'resend',
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  // Builds the Verify button
  Widget _buildVerifyButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildResendCodeRow(),
        const CustomGap(heightFactor: .01),
        PrimaryButton(
          onTap: showVerifyBtn == false
              ? () {}
              : () async {
                  NH.navigateTo(const UserProfileSetup());
                },
          text: isLoading ? 'verifying' : 'verify',
          borderRadius: 10.w,
          styleType: TextStyleType.subheading,
          width: .9,
          bgColor: showVerifyBtn == false ? AppColors.greyColor : null,
        ),
      ],
    );
  }
}
