// ignore_for_file: library_private_types_in_public_api

import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:careem/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common/common_widgets.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/global/global.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../food_delivery/widgets/restaurants_list.dart';

class DineOutOfferDetailScreen extends StatefulWidget {
  final Map data;

  const DineOutOfferDetailScreen({super.key, required this.data});
  @override
  _DineOutOfferDetailScreenState createState() =>
      _DineOutOfferDetailScreenState();
}

class _DineOutOfferDetailScreenState extends State<DineOutOfferDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    // Add a listener to the ScrollController to monitor scroll position
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // This method will check the scroll position
  void _onScroll() {
    if (_scrollController.offset > 30.h && !_showAppBar) {
      setState(() {
        _showAppBar = true; // Show AppBar when scroll exceeds 300 pixels
      });
    } else if (_scrollController.offset <= 30.h && _showAppBar) {
      setState(() {
        _showAppBar =
            false; // Hide AppBar when scroll is less than or equal to 300 pixels
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        Aio.navigationKey.currentContext!.watch<ThemeProvider>().isDarkTheme;
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomImageWidget(
                        imageUrl: widget.data['image'],
                        width: 100.w,
                      ),
                      CommonWidgets.buildGradientContainer(
                        widget.data,
                        height: 18.h,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: widget.data['title'],
                              styleType: TextStyleType.heading2,
                              color: isDarkMode
                                  ? AppColors.backgroundColorLight
                                  : AppColors.backgroundColorDark,
                            ),
                            TextWidget(
                              text:
                                  'Must try brunches! Double the fun for the price of one',
                              styleType: TextStyleType.body1,
                              color: isDarkMode
                                  ? AppColors.backgroundColorLight
                                  : AppColors.backgroundColorDark,
                            ),
                            Row(
                              children: [
                                CustomIconWidget(
                                  iconData: Icons.location_on_outlined,
                                  size: 17.sp,
                                  color: isDarkMode
                                      ? AppColors.backgroundColorLight
                                      : AppColors.backgroundColorDark,
                                ),
                                TextWidget(
                                  text: '21 Restaurants',
                                  styleType: TextStyleType.body1,
                                  color: isDarkMode
                                      ? AppColors.backgroundColorLight
                                      : AppColors.backgroundColorDark,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const RestaurantsList(
                    cardType: RestaurantsCardType.dineout,
                  ),
                ],
              ),
            ),
          ),
          // if (_showAppBar) ...[
          // Container(
          //   width: 100.w,
          //   height: 8.h,
          //   color: AppColors.backgroundColorLight,
          // )
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: context.watch<ThemeProvider>().isDarkTheme
                ? AppColors.backgroundColorDark
                : AppColors.backgroundColorLight,
            height: _showAppBar ? 8.h : 0,
            child: CustomAppBar(
              automaticallyImplyLeading: true,
              title: widget.data['title'],
            ),
          )
          // ]
        ],
      ),
    );
  }
}
