import 'package:flutter/material.dart';
import 'package:gameleven/data/models/item_provider.dart';
import 'package:gameleven/presentations/homeScreens/product_cart.dart';
import 'package:gameleven/utils/const.dart';
import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _SkipScreenState();
// }

// class _SkipScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Home page'),
//           centerTitle: true,
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.black],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               // transform: GradientRotation(math.pi /4)
//             ),
//           ),
//         ));
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemProvider>(context);
    return Scaffold(
      body: SizedBox(
        //height: MediaQuery.sizeOf(context).height,
        child: GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: itemProvider.itemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return ProductCard(
              onCartTap: () {
                itemProvider.setAddToCart(index);
                if (itemProvider.itemList[index]['in_cart'] == true) {
                  const snackBar = SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: primaryColor,
                      content: Text('Added to Cart'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  //itemProvider.removeFromCheckout(index);
                  const snackBar = SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: primaryColor,
                      content: Text('Remove from Cart'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },

              // onTap: (){
              //   pushNewScreen(
              //     context,
              //     screen: DetailsScreen(

              //       onPress:(){
              //         setState(() {
              //           itemProvider.setIsFavorite(index);
              //           if(itemProvider.itemList[index]['is_favorite'] == true){
              //             const snackBar = SnackBar(
              //                 duration: Duration(seconds: 1),
              //                 backgroundColor: CustomColor.primaryColor,
              //                 content: Text('Added to Wishlist')
              //             );
              //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //           }else{
              //             const snackBar = SnackBar(
              //                 duration: Duration(seconds: 1),
              //                 backgroundColor: CustomColor.primaryColor,
              //                 content: Text('Remove from Wishlist')
              //             );
              //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //           }
              //         });
              //       },
              //         productImage: itemProvider.itemList[index]['image']['big_size'],
              //       productPrice: itemProvider.itemList[index]['price'].toString(),
              //       productSubtitle: itemProvider.itemList[index]['sub_title'],
              //       productSpecialPrice: itemProvider.itemList[index]['special_price'].toString(),
              //       index: index,
              //       favorite: itemProvider.itemList[index]['is_favorite'],
              //       description: itemProvider.itemList[index]['details'],
              //       specification: itemProvider.itemList[index]['specification'],
              //     ),
              //     withNavBar: false, // OPTIONAL VALUE. True by default.
              //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
              //   );
              // },

              productImage: itemProvider.itemList[index]['image']
                  ['little_size'],
              productName: itemProvider.itemList[index]['name'],
              productPrice:
                  itemProvider.itemList[index]['special_price'].toString(),
              addToCart: itemProvider.itemList[index]['in_cart'],
            );
          },
        ),
      ),
    );
  }
}
