import 'package:careem/core/constants/images_constant.dart';
import 'package:careem/core/widgets/custom_image.dart';
import 'package:careem/modules/all_services/all_services.dart';
import 'package:careem/modules/eat_anything/dineout/screens/dine_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../modules/eat_anything/food_delivery/screens/food_delivery_screen.dart';
import '../../modules/get_anything/groceries/screens/groceries_screen.dart';
import '../../modules/other/home_sevices/modules/home_cleaning/home_cleaning_screen.dart';
import '../../modules/other/home_sevices/modules/laundry/laundry_screen.dart';
import '../../modules/other/home_sevices/modules/saloon_spa/saloon_spa_screen.dart';
import '../../modules/other/home_sevices/screens/home_services.dart';
import '../../modules/other/home_sevices/widgets/home_service_module_card.dart';

class AppList {
  static final List staggeredGridDineOutItems = [
    {
      "child": const DineOutOfferCard(
        title: 'Walk-in Offers',
        subtitle: '750+ restaurants',
        discount: '20% off',
      ),
      "mainAxisExtent": 18.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const DineOutOfferCard(
        title: 'Brunches',
        subtitle: '',
        discount: 'Buy 1 Get 1',
      ),
      "mainAxisExtent": 23.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const DineOutOfferCard(
        title: 'Buffets',
        subtitle: '',
        discount: '',
      ),
      "mainAxisExtent": 23.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const DineOutOfferCard(
        title: 'Bruiness Lunch',
        subtitle: '',
        discount: '',
      ),
      "mainAxisExtent": 18.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const DineOutOfferCard(
        title: 'Specials',
        subtitle: '',
        discount: '',
      ),
      "mainAxisExtent": 15.h,
      "crossAxisCellCount": 4,
    },
  ];
  static final List staggeredGridRestaurentsPhototsItems = [
    {
      "child": const CustomImageWidget(
        imageUrl:
            'https://content.jdmagicbox.com/comp/def_content_category/bikanervala/368254669-696308609203350-4353491342402938006-n-bikanervala-3748-r9xtq.jpg',
      ),
      "mainAxisExtent": 18.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const CustomImageWidget(
        imageUrl:
            'https://content.jdmagicbox.com/comp/def_content_category/the-beer-cafe-11978988-4yxw0kyg04.jpg',
      ),
      "mainAxisExtent": 23.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const CustomImageWidget(
        imageUrl:
            'https://content.jdmagicbox.com/v2/comp/pune/i8/020pxx20.xx20.231220160017.d4i8/catalogue/doolally-taproom-koregaon-park-pune-qdt69xldd3.jpg',
      ),
      "mainAxisExtent": 23.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const CustomImageWidget(
        imageUrl:
            'https://imgmediagumlet.lbb.in/media/2019/01/5c2f830ed5b20859433ee21c_1546617614971.jpg',
      ),
      "mainAxisExtent": 18.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const CustomImageWidget(
        imageUrl:
            'https://b.zmtcdn.com/data/collections/4e41758598775d808a8e70d6654df929_1725604011.png',
      ),
      "mainAxisExtent": 15.h,
      "crossAxisCellCount": 4,
    },
  ];
  static final List staggeredGridHomeServicesList = [
    {
      "child": const HomeServiceModuleCard(
          title: 'Home Cleaning',
          subtitle: 'by our Top-rated professional',
          screen: HomeCleaningScreen()),
      "mainAxisExtent": 25.h,
      "crossAxisCellCount": 4,
    },
    {
      "child": const HomeServiceModuleCard(
          title: 'Salon & Spa',
          subtitle: 'Massages haircuts and much more',
          screen: SalonSpaScreen()),
      "mainAxisExtent": 25.h,
      "crossAxisCellCount": 2,
    },
    {
      "child": const HomeServiceModuleCard(
          title: 'Laundry',
          subtitle: 'clean your clothes shoes & bags ',
          screen: LaundryScreen()),
      "mainAxisExtent": 25.h,
      "crossAxisCellCount": 2,
    },
  ];
  static final List modulesList = [
    {
      'title': 'Rides',
      'icon': ModulesImages.ridesIcon,
    },
    {
      'title': 'Groceries',
      'icon': ModulesImages.groceriesIcon,
      "screen": const GroceriesScreen()
    },
    {
      'title': 'Food',
      'icon': ModulesImages.foodIcon,
      "screen": const FoodDeliveryScreen()
    },
    {
      'title': 'DineOut',
      'icon': ModulesImages.dineOutIcon,
      "screen": const DineOutScreen()
    },
    {
      'title': 'Car Rental',
      'icon': ModulesImages.carRentalIcon,
    },
    {
      'title': 'Bike',
      'icon': ModulesImages.bikeIcon,
    },
    {
      'title': 'Shops',
      'icon': ModulesImages.shopsIcon,
    },
    {
      'title': 'Home Services',
      'icon': ModulesImages.homeServicesIcon,
      "screen": const HomeServices()
    },
    {
      'title': 'All Services',
      'icon': null,
      "screen": const AllServices(),
    },
  ];
  static const List dineOutList = [
    {
      'image':
          'https://b.zmtcdn.com/data/collections/4e41758598775d808a8e70d6654df929_1725604011.png',
      'title': 'The Big Chill Cakery',
    },
    {
      'image':
          'https://imgmediagumlet.lbb.in/media/2019/01/5c2f830ed5b20859433ee21c_1546617614971.jpg',
      'title': 'The Olive Bar & Kitchen',
    },
    {
      'image':
          'https://content.jdmagicbox.com/comp/def_content_category/bikanervala/368254669-696308609203350-4353491342402938006-n-bikanervala-3748-r9xtq.jpg',
      'title': 'Bikanervala',
    },
    {
      'image':
          'https://content.jdmagicbox.com/v2/comp/pune/i8/020pxx20.xx20.231220160017.d4i8/catalogue/doolally-taproom-koregaon-park-pune-qdt69xldd3.jpg',
      'title': 'Doolally Taproom',
    },
    {
      'image': 'https://info.ehl.edu/hubfs/1440/1440x960-barista.jpg',
      'title': 'Barista',
    },
    {
      'image':
          'https://content.jdmagicbox.com/comp/def_content_category/kailash-parbat/74835365-2483218271755110-7860212084972191744-n-kailash-parbat-999-tkqjg.jpg',
      'title': 'Kailash Parbat',
    },
    {
      'image':
          'https://content.jdmagicbox.com/comp/def_content_category/the-beer-cafe-11978988-4yxw0kyg04.jpg',
      'title': 'The Beer Café',
    },
    {
      'image':
          'https://static.toiimg.com/thumb/29992255/hardrockhyd.jpg?width=1200&height=900',
      'title': 'Hard Rock Café',
    },
    {
      'image':
          'https://images.immediate.co.uk/production/volatile/sites/2/2021/11/Mocha-1fc71f7.png?resize=768,574',
      'title': 'Mocha',
    },
    {
      'image':
          'https://media.telanganatoday.com/wp-content/uploads/2023/08/sodabottleopenerwala.jpg',
      'title': 'Soda Bottle Opener Wala',
    },
  ];
  static const List<Map<String, dynamic>> products = [
    {
      'title': "Banana Ecuador 500 g",
      'price': "AED 4.45",
      'oldPrice': "AED 5.40",
      'discount': "-18%",
      'imagePath': ImagesPath.dummyGroceryItem1,
    },
    {
      'title': "Oasis Drinking Water",
      'price': "AED 6.20",
      'oldPrice': "AED 9.25",
      'discount': "-33%",
      'imagePath': ImagesPath.dummyGroceryItem2,
    },
    {
      'title': "Mai Dubai Water 1.5 L x 6 pcs",
      'price': "AED 6.40",
      'oldPrice': "AED 9.75",
      'discount': "-34%",
      'imagePath': ImagesPath.dummyGroceryItem3,
    },
  ];

  static const List<Map<String, dynamic>> groceriesList = [
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-420,ar-486-333,pr-true,f-auto,q-80/cms/category/2b5f2be5-cada-4cd7-b0af-e46c0c065f71.png",
      "alt": "Fruits & Vegetables"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/4b28a9a2-8714-455c-ad17-fa765bbc3576.png",
      "alt": "Dairy, Bread & Eggs"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/54dd01e1-2781-4a45-bc3a-ed53ebab9bd9.png",
      "alt": "Atta, Rice, Oil & Dals"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-334,pr-true,f-auto,q-80/cms/category/9eda9af5-735b-4772-8e48-57f74e9d5547.png",
      "alt": "Meats, Fish & Eggs"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/8d4d3977-5197-49d9-9867-8a670524e48b.png",
      "alt": "Masala, Dry Fruits & More"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/ab241d87-da5b-4830-b38f-1a6cd30d0d41.png",
      "alt": "Breakfast & Sauces"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/031c2a24-d40f-4272-8c71-8a566252495e.png",
      "alt": "Zepto Cafe"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/92493ad5-6242-42f9-b951-dca41e55d744.png",
      "alt": "Tea, Coffee & More"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/31a3c3bd-1c0e-48ad-9441-0ba1c2552e3d.png",
      "alt": "Ice Creams & More"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/366e5b7d-2028-4935-b9f1-75bfa085c3d7.png",
      "alt": "Frozen Food"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/f76de631-1706-48c4-bf05-5161b8dbe9c9.png",
      "alt": "Sweet Cravings"
    },
    {
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/59d2c0cc-e776-407c-9142-7e69898d9eab.png",
      "alt": "Cold Drinks & Juices"
    },
    {
      "alt": "Home Needs",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/b322b3db-e75e-45e5-a11d-7ee37561c426.png"
    },
    {
      "alt": "Kitchen & Dining",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/c42610fc-a94c-40f6-9e74-d30c4a1f5895.png"
    },
    {
      "alt": "Cleaning Essentials",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-300-444,pr-true,f-auto,q-80/cms/category/08e817a4-96c6-478b-b240-cfab97050bc8.png"
    },
    {
      "alt": "Electronics & Appliances",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/c084c75c-82ca-497f-857c-5069c6723194.png"
    },
    {
      "alt": "Pet Care",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/14aaaa00-2252-4cf6-bea7-6884915592cc.png"
    },
    {
      "alt": "Toys & Sports",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/8d4fb022-bae0-432d-92c8-2b12d97ee6cc.png"
    },
    {
      "alt": "Stationery & Books",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/b5cfc944-9611-4f08-b4f9-a071d07b1aad.png"
    },
    {
      "alt": "Makeup & Beauty",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-420,ar-486-333,pr-true,f-auto,q-80/cms/category/55a9c3a6-4960-4744-b472-0929b06e0a4a.png"
    },
    {
      "alt": "Skincare",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/b1909dfd-726c-412b-beb7-9553bc909363.png"
    },
    {
      "alt": "Baby Care",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/227b70d5-d1cf-428b-a276-1392c5067eb3.png"
    },
    {
      "alt": "Bath & Body",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/e4fe52ef-96d9-4289-afb1-1c1ca7efd85b.png"
    },
    {
      "alt": "Hair Care",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-226-334,pr-true,f-auto,q-80/cms/category/eb6fe22a-f8b8-4189-8d9a-deb32ff659c9.png"
    },
    {
      "alt": "Jewellery",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/20d9687b-58a4-4bf7-a561-99198b4d5ca1.png"
    },
    {
      "alt": "Apparel & Lifestyle",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-229-349,pr-true,f-auto,q-80/cms/category/498eea73-358c-42c1-b482-158e80669be9.png"
    },
    {
      "alt": "Fragrances & Grooming",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/f894b757-ab40-4635-beb4-af6278fb4223.png"
    },
    {
      "alt": "Pharma & Wellness",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/63a99df0-98a9-42d8-a1bf-f414686663cd.png"
    },
    {
      "alt": "Feminine Hygiene",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/470527ff-829a-499f-9d79-32efb98a6e4d.png"
    },
    {
      "alt": "Sexual Wellness",
      "src":
          "https://cdn.zeptonow.com/production/tr:w-210,ar-225-333,pr-true,f-auto,q-80/cms/category/f4371151-d6ed-42d6-9338-8f7391d03fec.png"
    }
  ];

  static const List<Map<String, String>> saloonSpaDataList = [
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'bestselling'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'bestselling'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'bestselling'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'bestselling'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'hair removal'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'hair removal'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'hair removal'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'hair removal'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
    {
      'title': 'Winter Mani-Pedi Combo',
      'subTitle':
          'select our bestselling classic mani-padi combo with new fall and winter colors',
      'type': 'combos'
    },
  ];
  static const List<String> saloonSpaChipsList = [
    'Bestselling',
    'Hair Removal',
    'Combos'
  ];
  static const List addressList = [
    {
      'title': 'Find on Map',
      'prefixIcon': Icons.location_on_outlined,
      'suffixIcon': Icons.keyboard_arrow_right_rounded,
    },
    {
      'title': 'My home address',
      'prefixIcon': Icons.home,
      'suffixIcon': Icons.more_vert_rounded,
      'subTitle': 'check ut uw, Dibai,Dubai',
      'kilometes': '>99km',
    },
    {
      'title': 'Add new address',
      'prefixIcon': Icons.add_rounded,
      'suffixIcon': Icons.keyboard_arrow_right_rounded,
    },
  ];
  static final launderyServices = [
    {
      'imageUrl': 'assets/images/dry_cleaning.png',
      'title': 'Dry cleaning & Laundry',
    },
    {
      'imageUrl': 'assets/images/shoe_care.png',
      'title': 'Shoe & Bag Care',
    },
  ];

  static final launderyServicesPricingOptions = [
    {
      'imageUrl': 'assets/images/clean_press.png',
      'title': 'Clean & Press',
      'discountPrice': 'AED 13',
      'regularPrice': 'AED 18',
      'type': 'per shirt',
    },
    {
      'imageUrl': 'assets/images/press_only.png',
      'title': 'Press Only',
      'discountPrice': '',
      'regularPrice': '',
      'type': '',
    },
    {
      'imageUrl': 'assets/images/home_care.png',
      'title': 'Home Care',
      'discountPrice': 'AED 85',
      'regularPrice': 'AED 66',
      'type': 'per bag',
    },
    {
      'imageUrl': 'assets/images/wash_fold.png',
      'title': 'Wash & Fold',
      'discountPrice': 'AED 75',
      'regularPrice': 'AED 55',
      'type': 'per bag',
    },
    {
      'imageUrl': 'assets/images/shoe_bag_care.png',
      'title': 'Shoe & Bag Care',
      'discountPrice': '',
      'regularPrice': '',
      'type': '',
    },
    {
      'imageUrl': 'assets/images/luxury_cleaning.png',
      'title': 'Luxury Cleaning by The Finery',
      'discountPrice': '',
      'regularPrice': '',
      'type': '',
    },
  ];
}
