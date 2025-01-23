import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeServiceModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget screen;
  const HomeServiceModuleCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NH.navigateTo(screen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(12)),
        child: CustomPadding(
          horizontalFactor: .03,
          verticalFactor: .01,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextWidget(
                text: title,
                styleType: TextStyleType.subheading,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: subtitle,
                styleType: TextStyleType.body,
                maxLine: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
