import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map profileSettings = {
      "Your account": [
        {
          "title": "Personal information",
          "subTitle": "+918977904104",
          "icon": Icons.person_outlined
        },
        {"title": "Card and account", "icon": Icons.credit_card},
        {"title": "Saved addresses", "icon": Icons.location_on_outlined},
        {"title": "Notificaions", "icon": Icons.notifications_active},
        {"title": "Manage business profile", "icon": Icons.card_travel_rounded},
      ],
      "Benefits": [
        {
          "title": "Careem Plus",
          "subTitle": "See the benifits",
          "icon": Icons.abc
        }
      ],
      "Support": [
        {"title": "Help", "icon": Icons.help},
        {"title": "Rate the app", "icon": Icons.star_border},
        {"title": "Become a Captain", "icon": Icons.no_crash_outlined},
      ],
      "Preference": [
        {
          "title": "Language",
          "subTitle": "English",
          "icon": Icons.language_rounded
        },
        {
          "title": "City selection",
          "icon": Icons.location_on_outlined,
          "subTitle": "Dubai, United Arab Emorates",
        },
      ]
    };
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Syed Moiz Ali',
              automaticallyImplyLeading: true,
              actions: [
                CustomPadding(
                  horizontalFactor: .03,
                  child: TextWidget(
                    text: 'Help',
                    styleType: TextStyleType.body,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
            CustomPadding(
              horizontalFactor: .02,
              verticalFactor: .02,
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    AppColors.secondaryColor,
                    AppColors.secondaryColor.withOpacity(.8),
                    AppColors.primaryColor,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: CustomPadding(
                  horizontalFactor: .03,
                  verticalFactor: .02,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Careem+',
                        fontSize: 25.sp,
                        color: AppColors.backgroundColorLight,
                      ),
                      const CustomGap(heightFactor: .04),
                      const TextWidget(
                        text: 'See the benifits',
                        color: AppColors.backgroundColorLight,
                      ),
                      const TextWidget(
                        text: 'Save AED 300+ per month',
                        color: AppColors.backgroundColorLight,
                      ),
                      const CustomGap(heightFactor: .01),
                      const TextWidget(
                        text: 'start careem plus now',
                        color: AppColors.backgroundColorLight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: profileSettings.entries.map((e) {
                var key = e.key.toString();
                var data = List.from(e.value);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPadding(
                        horizontalFactor: .02,
                        verticalFactor: .02,
                        child: TextWidget(
                            text: key, styleType: TextStyleType.heading2)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(data.length, (index) {
                        var profileItem = data[index];
                        return CustomPadding(
                          horizontalFactor: .02,
                          verticalFactor: .02,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomPadding(
                                    horizontalFactor: .03,
                                    child: CustomIconWidget(
                                      iconData: profileItem['icon'],
                                      color: AppColors.disabledColor,
                                      size: 22.sp,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: profileItem['title'],
                                      ),
                                      if (profileItem['subTitle'] != null)
                                        TextWidget(
                                          text: profileItem['subTitle'],
                                          color: AppColors.greyColor,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomIconWidget(
                                iconData: Icons.keyboard_arrow_right_rounded,
                                size: 22.sp,
                              )
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
