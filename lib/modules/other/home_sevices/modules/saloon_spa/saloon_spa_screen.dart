import 'package:careem/core/constants/constants.dart';
import 'package:careem/core/navigation/navigator.dart';
import 'package:careem/core/widgets/custom_gap.dart';
import 'package:careem/core/widgets/custom_icon.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/text_widget.dart';
import 'widgets/saloon_spa_details_screen/saloon_spa_detail_screen.dart';

class SalonSpaScreen extends StatelessWidget {
  const SalonSpaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List salonSpaServices = [
      {
        'title': "Women's Salon",
        'image':
            'https://media.istockphoto.com/id/692999494/photo/hairdresser-cutting-some-hair-tips.jpg?s=612x612&w=0&k=20&c=5bC0fdICk914P5JWYDOi6N3CirJV4IBMTxYJh32vi8o='
      },
      {
        'title': "Women's Spa",
        'image': 'https://womensbyte.com/wp-content/uploads/2022/04/spa.jpg'
      },
      {
        'title': "Premium Men's Salon",
        'image':
            'https://t3.ftcdn.net/jpg/05/06/74/32/360_F_506743235_coW6QAlhxlBWjnRk0VNsHqaXGGH9F4JS.jpg'
      },
      {
        'title': "Men's Spa",
        'image':
            'https://content.jdmagicbox.com/comp/hyderabad/w8/040pxx40.xx40.220207160330.q3w8/catalogue/sweet-med-spa-madhapur-hyderabad-beauty-spas-9lhtjfb6wo.jpg'
      },
    ];
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Salon Spa',
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
          itemCount: salonSpaServices.length,
          itemBuilder: (context, index) {
            var serviceItem = salonSpaServices[index];
            return CustomPadding(
              horizontalFactor: .05,
              verticalFactor: .01,
              child: InkWell(
                // overlayColor: WidgetStatePropertyAll<Color>(
                //     AppColors.secondaryColor.withOpacity(.5)),
                onTap: () {
                  NH.navigateTo(SalonSpaDetailScreen(
                    title: serviceItem['title'],
                  ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.disabledColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageWidget(
                            imageUrl: serviceItem['image'],
                            width: 20.w,
                            height: 20.w,
                            borderRadius: BorderRadius.circular(800),
                          ),
                          const CustomGap(widthFactor: .03),
                          TextWidget(
                            text: serviceItem['title'],
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      CustomIconWidget(
                        iconData: Icons.arrow_forward,
                        size: 22.sp,
                      )
                      // Aio.customAppBarIcon(
                      //     icon: Icons.arrow_forward, opTap: () {})
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
