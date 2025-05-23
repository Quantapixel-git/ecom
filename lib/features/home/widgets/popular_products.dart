import 'package:ecom/features/trending/view/trending_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecom/components/product/product_card.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/route/screen_export.dart';
import 'package:go_router/go_router.dart';

import '../../../constants.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending products",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrendingScreen()));
                },
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            ],
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoPopularProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfetDiscount: demoPopularProducts[index].priceAfetDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {
                  context.go(
                    FullRouteName.productDetails,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
