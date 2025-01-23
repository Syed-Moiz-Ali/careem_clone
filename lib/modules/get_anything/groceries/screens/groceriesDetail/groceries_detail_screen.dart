import 'package:careem/core/common/common_widgets.dart';
import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/widgets/custom_appbar.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:careem/core/widgets/primary_button.dart';
import 'package:careem/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/enums/app_enums.dart';

class GroceriesDetailScreen extends StatelessWidget {
  final Map product;

  const GroceriesDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
        // prefixIcon: Aio.navigationBackIcon(),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(imageUrl: product['imagePath']),
          const CustomGap(heightFactor: .01),
          CustomPadding(
            horizontalFactor: .03,
            child: ProductDetails(
              title: product['title'],
              price: product['price'],
              oldPrice: product['oldPrice'],
              discount: product['discount'],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomBar(
        price: product['price'],
        oldPrice: product['oldPrice'],
        onAddToBasket: () {},
      ),
    );
  }
}

// Widget for the product image
class _ProductImage extends StatelessWidget {
  final String imageUrl;

  const _ProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomImageWidget(
      imageUrl: imageUrl,
      width: 100.w,
      height: 45.h,
    );
  }
}

// Widget for the product details
class ProductDetails extends StatelessWidget {
  final String title;
  final String price;
  final String oldPrice;
  final String discount;

  const ProductDetails({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          styleType: TextStyleType.heading,
          fontSize: 17.sp,
          maxLine: 5,
        ),
        const CustomGap(heightFactor: .01),
        Row(
          children: [
            TextWidget(
              text: price,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryColor,
              fontSize: 17.sp,
            ),
            const CustomGap(widthFactor: .03),
            TextWidget(
              text: oldPrice,
              fontSize: 15.sp,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
            const CustomGap(widthFactor: .03),
            CommonWidgets.discountPercentCard(discountPercent: discount),
          ],
        ),
      ],
    );
  }
}

// Widget for the bottom navigation bar
class _BottomBar extends StatelessWidget {
  final String price;
  final String oldPrice;
  final VoidCallback onAddToBasket;

  const _BottomBar({
    required this.price,
    required this.oldPrice,
    required this.onAddToBasket,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 13.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _PriceDisplay(price: price, oldPrice: oldPrice),
          PrimaryButton(
            onTap: onAddToBasket,
            text: 'Add to basket',
            width: .36,
            bgColor: AppColors.secondaryColor,
            textColor: AppColors.primaryColor,
            borderRadius: 100.w,
            height: .055,
          ),
        ],
      ),
    );
  }
}

// Widget for the price display
class _PriceDisplay extends StatelessWidget {
  final String price;
  final String oldPrice;

  const _PriceDisplay({required this.price, required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: price,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
          fontSize: 16.sp,
        ),
        const CustomGap(widthFactor: .03),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: oldPrice,
              fontSize: 16.sp,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
            const CustomGap(heightFactor: .01),
          ],
        ),
      ],
    );
  }
}
