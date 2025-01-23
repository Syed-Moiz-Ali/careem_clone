import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/enums/app_enums.dart';
import '../screens/dineout_offer_detail_screen.dart';

class DineOutCard extends StatelessWidget {
  final Map data;
  final DineOutCardType cardType;
  const DineOutCard(
      {super.key, required this.data, this.cardType = DineOutCardType.common});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NH.navigateTo(DineOutOfferDetailScreen(
          data: data,
        ));
      },
      child: cardType == DineOutCardType.common ? _cardType1() : _cardType2(),
    );
  }

  Widget _cardType1() {
    return Stack(
      children: [
        _buildImageContainer(),
        CommonWidgets.buildGradientContainer(
          useBackAsGradient: true,
          data,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }

  Widget _cardType2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _buildImageContainer(),
            Positioned(
                bottom: 2.w,
                left: 2.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.backgroundColorLight,
                  ),
                  width: 15.w,
                  height: 15.w,
                  child: const Center(child: TextWidget(text: 'icon')),
                ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'Vinci',
              color: AppColors.backgroundColorLight,
              styleType: TextStyleType.subheading2,
              fontWeight: FontWeight.bold,
            ),
            CommonWidgets.discountPercentCard(
                discountPercent: '25% off',
                bgColor: AppColors.primaryColor,
                fontSize: 16.sp,
                txtColor: AppColors.secondaryColor),
          ],
        )
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: 35.w,
      height: 24.h,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomImageWidget(
          imageUrl: data['image'],

          // 'https://b.zmtcdn.com/data/collections/4e41758598775d808a8e70d6654df929_1725604011.png',
        ),
      ),
    );
  }
}
