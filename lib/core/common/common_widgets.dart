import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../providers/theme_provider.dart';
import '../constants/constants.dart';
import '../enums/app_enums.dart';
import '../global/global.dart';
import '../navigation/navigator.dart';
import '../widgets/custom_icon.dart';
import '../widgets/text_widget.dart';

class CommonWidgets {
  static customAppBarIcon(
      {required IconData icon,
      required Function() opTap,
      double? size,
      double? scale}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(500)),
      child: CustomIconWidget(
        onTap: opTap,
        //  () {
        //   NH.navigateBack();
        // },
        // imageUrl: ImagesPath.backArrow,
        // iconData: Icons.arrow_back,
        iconData: icon,
        size: size ?? 20,
        scale: scale ?? 5,
      ),
    );
  }

  static navigationBackIcon() {
    return customAppBarIcon(
        icon: Icons.arrow_back,
        opTap: () {
          NH.navigateBack();
        });
  }

  static Widget sectionTitle(String title,
      {Function()? onTap,
      bool showIcon = true,
      double? fontSize,
      TextStyleType styleType = TextStyleType.heading2}) {
    var font = fontSize ?? Aio.size.width * .038;
    return CustomPadding(
      horizontalFactor: .03,
      verticalFactor: .01,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTap,
            child:
                TextWidget(text: title, styleType: styleType, fontSize: font),
          ),
          if (showIcon)
            CustomIconWidget(
              iconData: Icons.arrow_forward,
              size: 25.sp,
              onTap: onTap,
            ),
        ],
      ),
    );
  }

  static discountPercentCard(
      {required String discountPercent,
      Color bgColor = AppColors.errorColor,
      double? fontSize,
      Widget? prefixIcon,
      Color txtColor = AppColors.backgroundColorLight}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: bgColor,
      ),
      child: CustomPadding(
        horizontalFactor: .01,
        verticalFactor: .004,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon,
            TextWidget(
              text: discountPercent,
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w700,
              color: txtColor,
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildGradientContainer(Map data,
      {double? height,
      Alignment? alignment,
      Widget? child,
      bool? useBackAsGradient = false,
      BorderRadiusGeometry? borderRadius}) {
    var isDarkMode =
        Aio.navigationKey.currentContext!.watch<ThemeProvider>().isDarkTheme;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: height ?? 10.h,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: useBackAsGradient == true
                ? [
                    AppColors.backgroundColorDark.withOpacity(0),
                    AppColors.backgroundColorDark.withOpacity(1)
                  ]
                : [
                    isDarkMode
                        ? AppColors.backgroundColorDark.withOpacity(0)
                        : AppColors.backgroundColorLight
                            .withOpacity(0), // Light opacity dark color
                    isDarkMode
                        ? AppColors.backgroundColorDark.withOpacity(1)
                        : AppColors.backgroundColorLight.withOpacity(1),
                  ],
          ),
        ),
        child: Align(
          alignment: alignment ?? Alignment.bottomCenter,
          child: CustomPadding(
            verticalFactor: .01,
            horizontalFactor: .02,
            child: child ??
                TextWidget(
                  text: data['title'],
                  textAlign: TextAlign.center,
                  maxLine: 4,
                  color: AppColors.backgroundColorLight,
                ),
          ),
        ),
      ),
    );
  }

  static Widget buildRatingAndTime(String rating, String data,
      {Color color = AppColors.secondaryColor, double? fontSize}) {
    return Row(
      children: [
        TextWidget(
          text: rating,
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: fontSize ?? 15.sp,
        ),
        Container(
          height: .5.h,
          width: .5.h,
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: const BoxDecoration(
            color: AppColors.backgroundColorDark,
            shape: BoxShape.circle,
          ),
        ),
        TextWidget(
          text: data,
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: fontSize ?? 15.sp,
        ),
      ],
    );
  }

  static Widget subscribeCard() {
    return CustomPadding(
      horizontalFactor: .03,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.secondaryColor,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // AppColors.secondaryColor.withOpacity(.6),
                  AppColors.secondaryColor.withOpacity(.9),
                  AppColors.secondaryColor.withOpacity(.8),
                  AppColors.secondaryColor.withOpacity(.8),
                  AppColors.secondaryColor.withOpacity(.9),
                  // AppColors.primaryColor.withOpacity(.),
                  AppColors.secondaryColor,
                ])),
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Row(
              children: [
                TextWidget(
                  text: 'Subscrbe to get ',
                  styleType: TextStyleType.body,
                  color: AppColors.backgroundColorLight,
                ),
                TextWidget(
                  text: '50% OFF',
                  styleType: TextStyleType.subheading2,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward,
              size: 25.sp,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }

  static Widget chipWidget({
    required String text,
    Widget? icon,
    double? fontSize,
    Color? borderColor,
    Color? textColor,
    bool isSelected = false,
    TextStyleType styleType = TextStyleType.body1,
    ChipDirection direction = ChipDirection.row, // Default to Row
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor.withOpacity(.3) : null,
        border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : borderColor ?? AppColors.backgroundColorDark),
        borderRadius: BorderRadius.circular(120),
      ),
      child: CustomPadding(
        horizontalFactor: .03,
        verticalFactor: .007,
        child: direction == ChipDirection.row
            ? Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon, // Show icon if provided
                  TextWidget(
                    text: text,
                    styleType: styleType,
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon, // Show icon if provided
                  TextWidget(
                    text: text,
                    styleType: styleType,
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ],
              ),
      ),
    );
  }

  static Widget noticeWidget({
    required String notice,
    required VoidCallback onDetailPressed,
    Color? bgColor,
    Color textColor = AppColors.backgroundColorLight,
    double borderRadius = 12.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(12.0),
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.secondaryColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomIconWidget(
                iconData: Icons.error_outline,
                size: 23.sp,
                color: AppColors.backgroundColorLight,
              ),
              const CustomGap(widthFactor: .02),
              Expanded(
                child: TextWidget(
                  text: notice,
                  maxLine: 30,
                  color: textColor,
                ),
              ),
            ],
          ),
          const CustomGap(heightFactor: .02),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onDetailPressed,
              child: const TextWidget(
                text: 'Details',
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget bulletText({required Widget child}) {
    return Row(
      children: [
        Container(
          width: 1.w,
          height: 1.w,
          decoration: BoxDecoration(
            color: AppColors.backgroundColorDark,
            borderRadius: BorderRadius.circular(100.w),
          ),
        ),
        const CustomGap(widthFactor: .01),
        child,
      ],
    );
  }
}
