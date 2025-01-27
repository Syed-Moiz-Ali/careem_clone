import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/common/common_functions.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_gap.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../../../core/widgets/custom_padding.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/text_widget.dart';
import '../saloon_spa/widgets/address_selection_bottom_sheet.dart';
import 'widgets/delivery_instructions.dart';
import 'widgets/schedule_collection_bottomsheet.dart';
import 'widgets/schedule_delivery_screen.dart';

class CollectionDeliveryScreen extends StatelessWidget {
  const CollectionDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List collectionDeliveryList = [
      {
        'title': 'Add Address',
        'icon': Icons.location_on_outlined,
        'isActive': true,
        'screen': const AddressSelectionBottomSheet()
      },
      {
        'title': 'Schedule Collection',
        'icon': Icons.shopping_cart_checkout_outlined,
        'isActive': false,
        'screen': const ScheduleCollectionBottomsheet(),
      },
      {
        'title': 'Schedule Delivery',
        'icon': Icons.security_update_sharp,
        'isActive': false,
        'screen': const ScheduleDeliveryScreen(),
      },
      {
        'title': 'Driver Instructions',
        'icon': Icons.fire_truck_rounded,
        'isActive': false,
        'screen': const DeliveryInstructions(),
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Collection Delivery",
        automaticallyImplyLeading: true,
      ),
      body: CustomPadding(
        horizontalFactor: .02,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomGap(heightFactor: .01),
            Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 1.w,
                  decoration: BoxDecoration(
                    color: AppColors.disabledColor,
                    borderRadius: BorderRadius.circular(100.w),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 40.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100.w),
                    ),
                  ),
                )
              ],
            ),
            const CustomGap(heightFactor: .03),
            const TextWidget(
              text: 'Collection & Delivery',
              styleType: TextStyleType.heading,
            ),
            const CustomGap(heightFactor: .01),
            const TextWidget(
              text:
                  'We will collect your clothes from your doorstep and deliver them back to you after cleaning.',
              styleType: TextStyleType.body1,
              maxLine: 3,
            ),
            const CustomGap(heightFactor: .05),
            Column(
              children: List.generate(collectionDeliveryList.length, (index) {
                var collectionDelivery = collectionDeliveryList[index];
                return InkWell(
                  onTap: () {
                    CommonFunctions.customBottomSheet(
                        addPadding: false, child: collectionDelivery['screen']);
                  },
                  child: CustomPadding(
                    horizontalFactor: .03,
                    verticalFactor: .01,
                    child: Row(
                      children: [
                        Container(
                          width: 30.sp,
                          height: 30.sp,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                          child: CustomIconWidget(
                            iconData: collectionDelivery['icon'],
                            color: collectionDelivery['isActive']
                                ? AppColors.secondaryColor.withOpacity(.9)
                                : AppColors.disabledColor,
                            size: 20.sp,
                          ),
                        ),
                        const CustomGap(widthFactor: .05),
                        TextWidget(
                          text: collectionDelivery['title'],
                          color: collectionDelivery['isActive']
                              ? AppColors.secondaryColor.withOpacity(.9)
                              : AppColors.disabledColor,
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
            CustomPadding(
              verticalFactor: .03,
              horizontalFactor: .02,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.disabledColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomIconWidget(
                          iconData: Icons.file_copy_sharp,
                          size: 22.sp,
                        ),
                        const CustomGap(widthFactor: .05),
                        const TextWidget(text: 'Ho do i get the bags?'),
                      ],
                    ),
                    CustomIconWidget(
                      iconData: Icons.add_rounded,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 100.w,
        height: 10.h,
        decoration: const BoxDecoration(
            color: AppColors.backgroundColorLight,
            boxShadow: [
              BoxShadow(
                color: AppColors.backgroundColorDark,
                offset: Offset(0, 10),
                blurRadius: 14,
              )
            ]),
        child: Row(
          children: [
            PrimaryButton(
              onTap: () {},
              text: 'Price List',
              elevation: 0,
              width: .35,
              bgColor: AppColors.backgroundColorLight,
              textColor: AppColors.backgroundColorDark,
              borderRadius: 100.w,
              border: BorderSide(color: AppColors.backgroundColorDark),
            ),
            Expanded(
                child: PrimaryButton(
              onTap: () {},
              text: 'Continue',
              elevation: 0,
              width: .35,
              borderRadius: 100.w,
              fontWeight: FontWeight.bold,
            )),
          ],
        ),
      ),
    );
  }
}
