// ignore_for_file: library_private_types_in_public_api, unused_element, unused_element, duplicate_ignore

import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums/app_enums.dart';
import '../global/global.dart';
import '../../../providers/theme_provider.dart';
import '../constants/constants.dart';
import 'text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.actions = const [],
      this.prefixIcon,
      this.elevation = 4.0,
      this.centerTitle = false,
      this.styleType,
      this.backgroundColor,
      this.bottom,
      this.appBarHeight = 70.0,
      this.automaticallyImplyLeading});

  final List<Widget> actions;
  final bool? automaticallyImplyLeading;
  final bool centerTitle;
  final double elevation;
  final Widget? prefixIcon;
  final TextStyleType? styleType;
  final double appBarHeight;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  final String title;
  void _toggleTheme() async {
    var provider = Provider.of<ThemeProvider>(Aio.navigationKey.currentContext!,
        listen: false);
    var pref = Aio.pref!;
    bool newTheme = !provider.isDarkTheme;

    await provider.setIsDarkTheme(newTheme);
    await pref.setBool('_isDarkTheme', newTheme);
    await provider.setTheme(newTheme ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    // var theme = Aio.theme.colorScheme;

    return Selector<ThemeProvider, bool>(
        selector: (context, provider) => provider.isDarkTheme,
        builder: (context, isDarkTheme, _) {
          return Center(
            child: AppBar(
              // leading: CommonWidgets.navigationBackIcon(),
              // leadingWidth: 10.h,
              // backgroundColor: backgroundColor,
              forceMaterialTransparency: true,

              automaticallyImplyLeading: false,
              toolbarHeight: appBarHeight,
              title: Stack(
                children: [
                  SizedBox(
                    height: appBarHeight,
                    child: Row(
                      mainAxisAlignment: centerTitle
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        // if (!centerTitle) const CustomGap(widthFactor: .15),
                        if (automaticallyImplyLeading == true)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomPadding(
                              rightFactor: .03,
                              child: CommonWidgets.navigationBackIcon(),
                            ),
                          ),
                        Expanded(
                          child: TextWidget(
                            overflow: TextOverflow.ellipsis,
                            text: title,
                            styleType: styleType ?? TextStyleType.heading2,
                            textAlign: centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            color: !isDarkTheme
                                ? AppColors.backgroundColorDark
                                : AppColors.backgroundColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if (automaticallyImplyLeading == true)
                  //   Align(
                  //       alignment: Alignment.centerLeft,
                  //       // alignment: Alignment.centerLeft,
                  //       // left: 0,
                  //       // top: 0,
                  //       // bottom: 0,
                  //       // height: appBarHeight * .7,
                  //       // width: appBarHeight * .7,
                  //       child: CommonWidgets.navigationBackIcon())
                ],
              ),
              actions: [
                ...actions,
                // CustomPadding(
                //   rightFactor: .03,
                //   child: AnimatedSwitcher(
                //     duration: const Duration(milliseconds: 300),
                //     transitionBuilder: (child, animation) {
                //       return RotationTransition(
                //         turns: Tween<double>(begin: 0.0, end: 1.0)
                //             .animate(animation),
                //         child: child,
                //       );
                //     },
                //     child: CustomIconWidget(
                //       iconData:
                //           isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round,

                //       color: !isDarkTheme
                //           ? AppColors.backgroundColorDark
                //           : AppColors.backgroundColorLight,
                //       onTap: () {
                //         _toggleTheme();
                //       },
                //       // color: theme.surface,
                //     ),
                //   ),
                // ),
              ],
              centerTitle: centerTitle,
              elevation: 0,
              bottom: bottom,
              // backgroundColor: AppColors.backgroundColorLight,
            ),
          );
        });
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
