import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_image.dart';

class CategoryGridSection extends StatelessWidget {
  const CategoryGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    List foodCategoryList = [
      {
        "alt": "restaurants curated for biryani",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Biryani.png"
      },
      {
        "alt": "restaurant curated for cake",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_cake.png"
      },
      {
        "alt": "restaurant curated for chhole bhatoore",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_chole bhature.png"
      },
      {
        "alt": "restaurant curated for pakoda",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/f1263395-5d4a-4775-95dc-80ab6f3bbd89_pakoda.png"
      },
      {
        "alt": "restaurants curated for khichdi",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Khichdi.png"
      },
      {
        "alt": "restaurants curated for veg",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_Pure Veg.png"
      },
      {
        "alt": "restaurant curated for chinese",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Chinese.png"
      },
      {
        "alt": "restaurants curated for tea",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/cb5669c8-d6f1-46ab-b24d-3da99b9fa32c_tea.png"
      },
      {
        "alt": "restaurants curated for coffee",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_coffee.png"
      },
      {
        "alt": "restaurant curated for dessert",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Desserts.png"
      },
      {
        "alt": "restaurant curated for lassi",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/3f2c40d3-96c7-44ce-8b35-aef6ea746cdc_lassi.png"
      },
      {
        "alt": "restaurant curated for poori",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Poori.png"
      },
      {
        "alt": "restaurant curated for cutlet",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_cutlet.png"
      },
      {
        "alt": "restaurants curated for south indian",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_Salad-1.png"
      },
      {
        "alt": "restaurant curated for noodles",
        "src":
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Noodles.png"
      }
    ];

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var category = foodCategoryList[index];

          return _SingleCategoryCard(category: category);
        },
        childCount: foodCategoryList.length,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 20.h,
        mainAxisExtent: 18.h,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );

    //     SliverAnimatedGrid(
    //   initialItemCount: 0,
    //   itemBuilder: (context, index, animation) {
    //     log(_foodCategoryList.length.toString() + 'and ' + index.toString());
    //     var category = _foodCategoryList[index];
    //     return _SingleCategoryCard(category: category);
    //   },
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 20.h,
    //     mainAxisExtent: 18.h,
    //     crossAxisSpacing: 0,
    //     mainAxisSpacing: 0,
    //   ),
    // );

    //     SizedBox(
    //   height: 40.h,
    //   child: GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       // maxCrossAxisExtent: 20.h,
    //       mainAxisExtent: 15.h,
    //       crossAxisSpacing: 0,
    //       mainAxisSpacing: 0,
    //     ),
    //     itemCount: 20,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return _SingleCategoryCard();
    //     },
    //   ),
    // );
  }
}

class _SingleCategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const _SingleCategoryCard({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CustomImageWidget(
          imageUrl: category['src'],
          height: 13.h,
          width: 27.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
