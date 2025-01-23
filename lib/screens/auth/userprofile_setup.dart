import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/common/common_widgets.dart';
import '../../core/constants/constants.dart';
import '../../core/enums/app_enums.dart';
import '../../core/utils/provider_util/provider_helper.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/custom_gap.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_textfiled.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/text_widget.dart';

// import '../main/bottom_navigation/bottom_navigation_bar.dart';

class UserProfileSetup extends StatelessWidget {
  const UserProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = ProviderHelper.read.authProvider();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        allSidesFactor: .03,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextWidget(
              text: 'account_setup_title',
              styleType: TextStyleType.heading,
              textAlign: TextAlign.start,
              maxLine: 2,
            ),
            const CustomGap(heightFactor: .01),
            _buildUserProfileDis(),
            const CustomGap(heightFactor: .03),
            CustomTextField(
              controller: provider.fullNameController,
              labelText: 'Full Name',
              hintText: 'Enter Your Full Name',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildVerifyButton(),
    );
  }

  // Builds the OTP description with dynamic phone number
  Widget _buildUserProfileDis() {
    return TextWidget(
      text: 'account_setup_dis',
      textAlign: TextAlign.start,
      fontSize: 14.sp,
      color: AppColors.backgroundColorDark.withOpacity(.6),
    );
  }

  Widget _buildVerifyButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TextWidget(
            text:
                "By creating Careem account  you are agreeing with careem's terms & conditions . privacy policy"),
        PrimaryButton(
          onTap: () {
            NH.navigateTo(const HomeScreen());
            // Aio.naviga  teTo(BottomNavigationBarScreen());
          },
          text: 'submit',
          borderRadius: 100.w,
          styleType: TextStyleType.subheading,
          width: .9,
        ),
      ],
    );
  }
}
