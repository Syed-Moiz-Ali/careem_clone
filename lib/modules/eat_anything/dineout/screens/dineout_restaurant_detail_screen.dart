import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/utils/provider_util/provider_helper.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_staggeredgrid_widget.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/images_constant.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_padding.dart';

class DineOutRestaurantDetailScreen extends StatelessWidget {
  const DineOutRestaurantDetailScreen({super.key});

  // Image Carousel Widget
  Widget _buildImageCarousel() {
    final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);

    return ProviderHelper.valueBuilder.builder(
      valueListenable: carouselNotifier,
      builder: (value) {
        return SizedBox(
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarouselSlider(carouselNotifier),
              const CustomGap(widthFactor: .03),
            ],
          ),
        );
      },
    );
  }

  // Carousel Slider Implementation
  Widget _buildCarouselSlider(ValueNotifier<int> carouselNotifier) {
    return Stack(
      children: [
        CarouselSlider(
          items: List.generate(10, (index) {
            return CustomImageWidget(
              imageUrl: ImagesPath.dummyFoodItem2,
              width: 100.w,
              fit: BoxFit.cover,
            );
          }),
          options: CarouselOptions(
            height: 45.h,
            viewportFraction: 1,
            onPageChanged: (value, reason) {
              carouselNotifier.value = value;
            },
          ),
        ),
        Positioned(
          bottom: 4.w,
          right: 2.w,
          child: CommonWidgets.discountPercentCard(
            fontSize: 16.sp,
            prefixIcon: CustomPadding(
              allSidesFactor: .005,
              child: CustomIconWidget(
                  iconData: Icons.camera_alt_outlined,
                  size: 4.w,
                  color: AppColors.backgroundColorLight),
            ),
            bgColor: AppColors.secondaryColor,
            discountPercent: '${carouselNotifier.value + 1} of ${10}',
          ),
        ),
        Positioned(
          bottom: 4.w,
          left: 2.w,
          child: CommonWidgets.discountPercentCard(
            fontSize: 16.sp,
            bgColor: AppColors.secondaryColor,
            discountPercent: 'Open untill 11:00 PM',
          ),
        ),
      ],
    );
  }

  // Restaurant Details Section
  Widget _buildRestaurantDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Lulu & The Beanstalk',
          styleType: TextStyleType.heading1,
        ),
        TextWidget(
          text:
              'Icd Brookfield Place, Al Mustaqbal Street, Dubai International Financial Center (DIFC)',
        ),
      ],
    );
  }

  // Rating and Subscription Card
  Widget _buildRatingAndSubscription() {
    return Column(
      children: [
        CommonWidgets.buildRatingAndTime('4.8', '(149 rating on Google)',
            fontSize: 17.sp),
        const CustomGap(heightFactor: .01),
        CommonWidgets.subscribeCard(),
      ],
    );
  }

  // Action Chips Section
  Widget _buildActionChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildChip('Map', Icons.location_on_outlined),
        _buildChip('Book a ride', Icons.directions_car_rounded),
        _buildChip('Call', Icons.call_rounded),
      ],
    );
  }

  // Reusable Chip Widget Builder
  Widget _buildChip(String text, IconData icon) {
    return CommonWidgets.chipWidget(
      text: text,
      styleType: TextStyleType.body,
      fontSize: 17.sp,
      icon: CustomPadding(
        horizontalFactor: 0.007,
        child: CustomIconWidget(
          iconData: icon,
          size: 20.sp,
          color: AppColors.backgroundColorDark,
        ),
      ),
    );
  }

  Widget _menuCard() {
    return Row(
      children: [
        const CustomGap(widthFactor: .04),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secondaryColor.withOpacity(.5).withAlpha(28),
          ),
          child: CustomPadding(
            horizontalFactor: .035,
            verticalFactor: .015,
            child: CustomIconWidget(
              iconData: Icons.menu_book_rounded,
              size: 25.sp,
            ),
          ),
        ),
        const CustomGap(widthFactor: .04),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'View Menu',
              styleType: TextStyleType.subheading2,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              text: 'Bon appetit',
              styleType: TextStyleType.body,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List staggeredGridRestaurentsPhototsItems = [
      {
        "child": CustomImageWidget(
          borderRadius: BorderRadius.circular(12),
          imageUrl:
              'https://content.jdmagicbox.com/comp/def_content_category/bikanervala/368254669-696308609203350-4353491342402938006-n-bikanervala-3748-r9xtq.jpg',
        ),
        "mainAxisExtent": 26.h,
        "crossAxisCellCount": 4,
      },
      {
        "child": CustomImageWidget(
          borderRadius: BorderRadius.circular(12),
          imageUrl:
              'https://content.jdmagicbox.com/comp/def_content_category/the-beer-cafe-11978988-4yxw0kyg04.jpg',
        ),
        "mainAxisExtent": 12.h,
        "crossAxisCellCount": 2,
      },
      {
        "child": CustomImageWidget(
          borderRadius: BorderRadius.circular(12),
          imageUrl:
              'https://content.jdmagicbox.com/v2/comp/pune/i8/020pxx20.xx20.231220160017.d4i8/catalogue/doolally-taproom-koregaon-park-pune-qdt69xldd3.jpg',
        ),
        "mainAxisExtent": 25.h,
        "crossAxisCellCount": 2,
      },
      {
        "child": CustomImageWidget(
          borderRadius: BorderRadius.circular(12),
          imageUrl:
              'https://imgmediagumlet.lbb.in/media/2019/01/5c2f830ed5b20859433ee21c_1546617614971.jpg',
        ),
        "mainAxisExtent": 12.h,
        "crossAxisCellCount": 2,
      },
      // {
      //   "child": CustomImageWidget(
      //     borderRadius: BorderRadius.circular(12),
      //     imageUrl:
      //         'https://b.zmtcdn.com/data/collections/4e41758598775d808a8e70d6654df929_1725604011.png',
      //   ),
      //   "mainAxisExtent": 20.h,
      //   "crossAxisCellCount": 4,
      // },
    ];
    return Scaffold(
      // appBar: CustomAppBar(title: '', automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(),
            CustomPadding(
              horizontalFactor: .02,
              child: Column(
                children: [
                  _buildRestaurantDetails(),
                  const CustomGap(heightFactor: .005),
                  _buildRatingAndSubscription(),
                  const CustomGap(heightFactor: .02),
                  _buildActionChips(),
                  const CustomGap(heightFactor: .04),
                  _menuCard(),
                  const CustomGap(heightFactor: .02),
                  CommonWidgets.sectionTitle('Photos', fontSize: 15.sp),
                  CustomStaggeredgridWidget(
                      staggeredGridItems: staggeredGridRestaurentsPhototsItems),
                  const CustomGap(heightFactor: .02),
                  CommonWidgets.sectionTitle('useful bits', fontSize: 15.sp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
