import 'package:careem/core/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/common/ads_widget.dart';
import '../../../../../core/common/common_functions.dart';
import '../../../../../core/common/common_widgets.dart';
import '../../../../../core/common/offers_widget.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/utils/app_list.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_gap.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../../../../../core/widgets/custom_padding.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/text_widget.dart';
import 'collection_delivery_screen.dart';

class LaundryScreen extends StatelessWidget {
  const LaundryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var services = AppList.launderyServices;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Laundry',
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomGap(heightFactor: .03),
            const OffersList(),
            CustomPadding(
              horizontalFactor: .03,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: 'Select Service(s)',
                    styleType: TextStyleType.heading2,
                  ),
                  const CustomGap(heightFactor: .02),
                  ServicesList(services: services),
                ],
              ),
            ),
            const AdsWidget(),
            const CustomGap(heightFactor: .15),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CustomPadding(
          verticalFactor: .02,
          child: PrimaryButton(
            borderRadius: 100.w,
            height: .06,
            width: .9,
            onTap: () {
              NH.navigateTo(const CollectionDeliveryScreen());
            },
            child: CustomPadding(
              horizontalFactor: .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    text: 'Place New Order',
                    fontWeight: FontWeight.bold,
                    styleType: TextStyleType.body,
                  ),
                  CustomIconWidget(
                    iconData: Icons.arrow_right_alt_rounded,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return const OffersWidget();
        }),
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  final List<Map<String, String>> services;

  const ServicesList({required this.services, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(services.length, (index) {
        var service = services[index];
        return Column(
          children: [
            ServiceRow(
              imageUrl: service['imageUrl']!,
              title: service['title']!,
              onTap: () {},
            ),
            const CustomGap(heightFactor: .02),
          ],
        );
      }),
    );
  }
}

class ServiceRow extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const ServiceRow({
    required this.imageUrl,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List pricingOptions = AppList.launderyServicesPricingOptions;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomImageWidget(
              imageUrl: '',
              width: 17.w,
              height: 17.w,
              borderRadius: BorderRadius.circular(100.w),
            ),
            const CustomGap(widthFactor: .03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  styleType: TextStyleType.body,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {
                    CommonFunctions.customBottomSheet(
                      addPadding: false,
                      child: CustomPadding(
                        horizontalFactor: .03,
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 80.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomGap(heightFactor: .03),
                                const TextWidget(
                                  text: 'Select bag for pricing',
                                  styleType: TextStyleType.heading2,
                                ),
                                const CustomGap(heightFactor: .02),
                                PricingOptionsList(
                                    pricingOptions: pricingOptions),
                                const CustomGap(heightFactor: .03),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const TextWidget(
                    text: 'view pricing',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
        CommonWidgets.chipWidget(
          text: '+Add',
          borderColor: AppColors.disabledColor.withOpacity(.4),
          textColor: AppColors.secondaryColor,
          onTap: onTap,
        ),
      ],
    );
  }
}

class PricingOptionsList extends StatelessWidget {
  final List pricingOptions;

  const PricingOptionsList({required this.pricingOptions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(pricingOptions.length, (index) {
        var option = pricingOptions[index];
        return Column(
          children: [
            PricingRow(
              imageUrl: option['imageUrl']!,
              title: option['title']!,
              discountPrice: option['discountPrice']!,
              regularPrice: option['regularPrice']!,
              type: option['type']!,
              onTap: () {},
            ),
            const CustomGap(heightFactor: .02),
          ],
        );
      }),
    );
  }
}

class PricingRow extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String discountPrice;
  final String regularPrice;
  final String type;
  final VoidCallback onTap;

  const PricingRow({
    required this.imageUrl,
    required this.title,
    required this.discountPrice,
    required this.regularPrice,
    required this.type,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.disabledColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: CustomPadding(
        horizontalFactor: .01,
        verticalFactor: .01,
        child: Row(
          children: [
            CustomImageWidget(
              imageUrl: '',
              width: 13.w,
              height: 13.w,
              borderRadius: BorderRadius.circular(100.w),
            ),
            const CustomGap(widthFactor: .03),
            TextWidget(
              text: title,
              styleType: TextStyleType.body,
              fontWeight: FontWeight.bold,
            ),
            const CustomGap(widthFactor: .01),
            if (regularPrice.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: CustomPadding(
                  horizontalFactor: .02,
                  child: Row(
                    children: [
                      TextWidget(
                        text: regularPrice,
                        decoration: TextDecoration.lineThrough,
                      ),
                      const CustomGap(widthFactor: .01),
                      TextWidget(
                        text: '$discountPrice $type',
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
