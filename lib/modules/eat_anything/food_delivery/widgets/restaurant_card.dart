import 'dart:developer';

import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/constants/images_constant.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:careem/modules/eat_anything/dineout/screens/dineout_restaurant_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/food_detail_screen.dart';

// class RestaurantsList extends StatelessWidget {
//   final RestaurantsCardType cardType;
//   const RestaurantsList(
//       {super.key, this.cardType = RestaurantsCardType.nearBy});

//   Axis get scrollDirection {
//     switch (cardType) {
//       case RestaurantsCardType.allRestaurants:
//         return Axis.vertical;
//       case RestaurantsCardType.nearBy:
//       default:
//         return Axis.horizontal;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return cardType == RestaurantsCardType.allRestaurants
//         ? Column(
//             children: List.generate(6, (index) {
//               return CustomPadding(
//                 verticalFactor: .01,
//                 child: RestaurantCard(cardType: cardType),
//               );
//             }),
//           )
//         : SingleChildScrollView(
//             scrollDirection: scrollDirection,
//             child: Row(
//               children: List.generate(6, (index) {
//                 return CustomPadding(
//                   horizontalFactor: .02,
//                   child: RestaurantCard(cardType: cardType),
//                 );
//               }),
//             ),
//           );
//   }
// }

class RestaurantCard extends StatelessWidget {
  final RestaurantsCardType cardType;

  const RestaurantCard({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardType == RestaurantsCardType.dineout) {
          NH.navigateTo(const DineOutRestaurantDetailScreen());
        } else {
          NH.navigateTo(const FoodDetailScreen());
        }
      },
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    switch (cardType) {
      case RestaurantsCardType.allRestaurants:
        return _cardType2();
      case RestaurantsCardType.dineout:
        return _cardType3();
      case RestaurantsCardType.nearBy:
      default:
        return _cardType1();
    }
  }

  Widget _cardType1() {
    return _buildCardLayout(
      imageUrl: ImagesPath.dummyFoodItem1,
      title: 'Coffee House',
      rating: '4.6',
      time: '20 - 25 min',
      details: 'Cafe,Coffee',
      distance: '0.1 km',
    );
  }

  Widget _cardType2() {
    return _buildCardLayout(
      imageUrl: ImagesPath.dummyFoodItem2,
      title: 'Mini & Co - Dutch Square',
      rating: '4.6',
      time: '20 - 25 min',
      details: 'Cafe,Coffee',
      distance: '0.1 km',
      isRowLayout: true,
    );
  }

  Widget _cardType3() {
    final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);

    return ProviderHelper.valueBuilder.builder(
      valueListenable: carouselNotifier,
      builder: (value) {
        return Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageCarousel(carouselNotifier),
              const CustomGap(widthFactor: .03),
              _buildInfoSection('Mini & Co - Dutch Square', '4.6',
                  'Level 1, Dubai Festival City Mall', '10% off on A la carte'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardLayout({
    required String imageUrl,
    required String title,
    required String rating,
    required String time,
    required String details,
    required String distance,
    bool isRowLayout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100.w,
      child: isRowLayout
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(imageUrl, 20.h, 30.w,
                    borderRadius: BorderRadius.circular(12)),
                const CustomGap(widthFactor: .03),
                _buildInfoSection(title, rating, time, details, distance),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(imageUrl, 15.h, 100.w),
                const SizedBox(height: 8),
                _buildInfoSection(title, rating, time, details, distance),
              ],
            ),
    );
  }

  Widget _buildInfoSection(
      String title, String rating, String time, String details,
      [String distance = '']) {
    return CustomPadding(
      horizontalFactor: .03,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: title,
            fontWeight: FontWeight.w700,
          ),
          CommonWidgets.buildRatingAndTime(rating, time),
          _buildDetails(details, distance),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(ValueNotifier<int> carouselNotifier) {
    final PageController pageController = PageController();
    // loopPageView(pageController);

    return Stack(
      children: [
        SizedBox(
          height: 25.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: PageView.builder(
              controller: pageController,
              itemCount: 10,
              onPageChanged: (value) {
                // Update the ValueNotifier when the page changes
                carouselNotifier.value = value;
                log('the value is $value');
                // if (value == pageCount - 1) {
                //   pageController.animateToPage(0,
                //       duration: const Duration(milliseconds: 300),
                //       curve: Curves.linear);
                // }
                // if (value == 0) {
                //   pageController.animateToPage(pageCount - 1,
                //       duration: const Duration(milliseconds: 300),
                //       curve: Curves.linear);
                // }
              },
              itemBuilder: (context, index) {
                return _buildImage(ImagesPath.dummyFoodItem2, 25.h, 100.w,
                    borderRadius: BorderRadius.circular(0));
              },
            ),
          ),
        ),
        Positioned(
          bottom: 4.w,
          left: 2.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(10, (index) {
              return CustomPadding(
                horizontalFactor: .003,
                child: Container(
                  height: 1.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: carouselNotifier.value == index
                        ? AppColors.backgroundColorLight
                        : AppColors.disabledColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void loopPageView(PageController pageController) {
    pageController.addListener(() {
      const pageCount = 10; // Number of pages in the PageView
      if (pageController.page == pageCount - 1) {
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
      if (pageController.page == 0) {
        pageController.animateToPage(pageCount - 1,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  Widget _buildImage(String imageUrl, double height, double width,
      {BorderRadius? borderRadius}) {
    return ClipRRect(
      borderRadius: borderRadius ??
          const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: CustomImageWidget(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails(String detail1, String detail2) {
    return Row(
      children: [
        TextWidget(
          text: detail1,
          color: AppColors.disabledColor,
          fontSize: 14.sp,
        ),
        TextWidget(
          text: ' . ',
          styleType: TextStyleType.heading,
          color: AppColors.disabledColor,
          fontSize: 14.sp,
        ),
        TextWidget(
          text: detail2,
          color: AppColors.disabledColor,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
