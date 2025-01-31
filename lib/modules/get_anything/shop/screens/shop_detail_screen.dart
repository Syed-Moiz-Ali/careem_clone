// ignore_for_file: library_private_types_in_public_api
import 'package:careem/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/common/common_functions.dart';
import '../../../../core/common/common_widgets.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/utils/app_list.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_icon.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_textfiled.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../other/home_sevices/modules/saloon_spa/widgets/address_selection_bottom_sheet.dart';
import '../../groceries/widgets/products_list.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  _ShopDetailScreenState createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  final double _appBarHeight = 30.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: '{Shop Name}',
          centerTitle: true,
          appBarHeight: _appBarHeight,
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
            preferredSize: Size(100.w, 5.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      CommonFunctions.customBottomSheet(
                        addPadding: false,
                        child: const AddressSelectionBottomSheet(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconWidget(
                          iconData: Icons.location_on_outlined,
                          size: 22.sp,
                        ),
                        const TextWidget(
                            text: 'Deliver to so',
                            styleType: TextStyleType.body),
                      ],
                    ),
                  ),
                  const CustomGap(heightFactor: .02),
                  AnimatedContainer(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.disabledColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    duration: const Duration(milliseconds: 400),
                    child: const Column(
                      children: [
                        TextWidget(text: 'Demo'),
                        TextWidget(text: 'Demo'),
                      ],
                    ),
                  ),
                  const CustomGap(heightFactor: .006),
                  CustomTextField(
                    controller: TextEditingController(),
                    labelText: 'Search Here',
                    radius: 40.w,
                    suffixIcon: CustomIconWidget(
                      iconData: Icons.search_rounded,
                      size: 24.sp,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildGridView(),
              _buildProductSection('Fruits & Vegitables'),
              _buildProductSection('Salty Snacks'),
            ],
          ),
        ));
  }

  Widget _buildProductSection(String title) {
    return Column(
      children: [
        ProductList(
          title: title,
          products: AppList.products,
        ),
        const CustomGap(heightFactor: .04),
      ],
    );
  }

  Widget _buildGridView() {
    List groceriesList = AppList.groceriesList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const TextWidget(text: 'Categories', styleType: TextStyleType.heading),
        CommonWidgets.sectionTitle('Shop by Category'),

        const CustomGap(heightFactor: .03),
        SizedBox(
          height: 80.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 0,
                mainAxisExtent: 14.h,
                mainAxisSpacing: 0,
                maxCrossAxisExtent: 20.h),
            itemCount: groceriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var grocery = groceriesList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  // color: AppColors.disabledColor,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CustomImageWidget(
                        height: 18.h,
                        width: 27.w,
                        fit: BoxFit.contain,
                        imageUrl: grocery['src'],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
