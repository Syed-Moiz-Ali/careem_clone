import 'package:flutter/material.dart';
import '../../../../core/common/common_widgets.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/widgets/custom_gap.dart';
import '../../../../core/widgets/custom_padding.dart';
import 'restaurant_card.dart';

class RestaurantsListSection extends StatelessWidget {
  final String title;
  final RestaurantsCardType cardType;
  final bool showHeaderIcon;

  const RestaurantsListSection({
    super.key,
    required this.title,
    required this.cardType,
    this.showHeaderIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets.sectionTitle(title,
              styleType: TextStyleType.heading2, showIcon: showHeaderIcon),
          const CustomGap(heightFactor: .02),
          RestaurantsList(cardType: cardType),
        ],
      ),
    );
  }
}

class RestaurantsList extends StatelessWidget {
  final RestaurantsCardType cardType;
  const RestaurantsList(
      {super.key, this.cardType = RestaurantsCardType.nearBy});

  Axis get scrollDirection {
    switch (cardType) {
      case RestaurantsCardType.allRestaurants:
        return Axis.vertical;
      case RestaurantsCardType.nearBy:
      default:
        return Axis.horizontal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return cardType != RestaurantsCardType.nearBy
        ? Column(
            children: List.generate(6, (index) {
              return CustomPadding(
                verticalFactor: .01,
                child: RestaurantCard(cardType: cardType),
              );
            }),
          )
        : SingleChildScrollView(
            scrollDirection: scrollDirection,
            child: Row(
              children: List.generate(6, (index) {
                return CustomPadding(
                  horizontalFactor: .02,
                  child: RestaurantCard(cardType: cardType),
                );
              }),
            ),
          );
  }
}
