import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/enums/app_enums.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/custom_staggeredgrid_widget.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:careem/modules/eat_anything/dineout/widgets/dineout_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_list.dart';
import '../../food_delivery/widgets/restaurants_list.dart';
import '../widgets/dineout_offers_widgets.dart';
import 'dineout_staggered_grid_details_detail.dart';

class DineOutScreen extends StatelessWidget {
  const DineOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List dineOutList = AppList.dineOutList;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'DineOut',
        automaticallyImplyLeading: true,
      ),
      body: CustomScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomStaggeredgridWidget(
                  staggeredGridItems: AppList.staggeredGridDineOutItems,
                ),
                CommonWidgets.sectionTitle('Where to go today?',
                    fontSize: 16.sp, styleType: TextStyleType.heading2),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(dineOutList.length, (index) {
                      var dineOut = dineOutList[index];
                      return CustomPadding(
                        horizontalFactor: .01,
                        child: DineOutCard(
                          data: dineOut,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const CustomGap(heightFactor: .02),
                const DineOutOffersWidgets(),
              ],
            ),
          ),
          // Common.sectionTitle('Explore dining sports',
          //     fontSize: 16.sp,
          //     styleType: TextStyleType.heading2,
          //     showIcon: false),

          const RestaurantsListSection(
            title: 'Explore dining sports',
            cardType: RestaurantsCardType.dineout,
            showHeaderIcon: false,
          ),
        ],
      ),
    );
  }
}

class DineOutOfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String discount;

  const DineOutOfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NH.navigateTo(DineOutStaggeredGridDetailsDetail(
          title: title,
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.disabledColor.withOpacity(.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            CustomPadding(
              allSidesFactor: .01,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    styleType: TextStyleType.subheading2,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  if (subtitle.isNotEmpty)
                    TextWidget(
                      text: subtitle,
                      styleType: TextStyleType.body1,
                    ),
                ],
              ),
            ),
            if (discount.isNotEmpty)
              Positioned(
                left: 15.sp,
                bottom: 15.sp,
                child: CommonWidgets.discountPercentCard(
                  fontSize: 15.sp,
                  discountPercent: discount,
                  bgColor: AppColors.secondaryColor,
                  txtColor: AppColors.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
