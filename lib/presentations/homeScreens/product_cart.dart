import 'package:flutter/material.dart';
import 'package:gameleven/presentations/homeScreens/home_global_widget.dart';
// import '../../home_package.dart';

class ProductCard extends StatelessWidget {
  final String productImage, productName, productPrice;
  final dynamic onTap, onCartTap;
  final bool addToCart;
  const ProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.addToCart,
    this.onTap,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 234,
      width: 182,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 4,
                offset: const Offset(0, 5))
          ]),
      child: Padding(
        padding: EdgeInsets.fromLTRB(11, 10, 11, 0),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        productImage,
                        fit: BoxFit.fill,
                      )),
                  SpaceInHeight(height: 7),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 33,
                      width: 128,
                      child: TextRegular(
                          text: productName,
                          color: CustomColor.cardTextColor,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            //SpaceInHeight(height: 6.h),
            SizedBox(
              height: 26,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 16,
                    width: 60,
                    child: TextMedium(
                      text: '$productPrice SAR',
                      fontSize: 12,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                      height: 26,
                      width: 26,
                      child: InkWell(
                          onTap: onCartTap,
                          child: addToCart
                              ? const CartIcon(
                                  color: CustomColor.primaryColor,
                                  iconColor: Colors.white,
                                )
                              : const CartIcon(
                                  color: Color(0xffF4F4F4),
                                  iconColor: Color(0xff3B3B3B),
                                )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
