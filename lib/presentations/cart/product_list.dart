import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gameleven/presentations/cart/cart_list.dart';
import 'package:gameleven/presentations/cart/cart_model.dart';
import 'package:gameleven/presentations/cart/cart_provider.dart';
import 'package:gameleven/presentations/cart/db_helper.dart';
import 'package:gameleven/presentations/cart/utils.dart';
// import 'package:myapp/Utils/utils.dart';
// import 'package:myapp/cart_list.dart';
// import 'package:myapp/cart_model.dart';
// import 'package:myapp/cart_provider.dart';
// import 'package:myapp/db_helper.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  DBHelper dbHelper = DBHelper();

  List<String> productName = [
    'Mango',
    'Orange',
    'Graphs',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit'
  ];

  List<String> productUnit = ['KG', 'Dozen', 'KG', 'Dozen', 'KG', 'KG', 'KG'];

  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];

  List<String> productImage = [
    'https://www.svz.com/wp-content/uploads/2018/05/Mango.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Orange-Fruit-Pieces.jpg/2560px-Orange-Fruit-Pieces.jpg',
    'https://dailyshoppingbd.com/images/detailed/87/Grape.jpg',
    'https://www.shutterstock.com/image-photo/bunch-bananas-isolated-on-white-600nw-1722111529.jpg',
    'https://m.media-amazon.com/images/I/71Bk6iMGNFL._AC_UF894,1000_QL80_.jpg',
    'https://cdn.mos.cms.futurecdn.net/2wtUPt2xZ9oeZf6jRFmEzg.jpg',
    'https://4.imimg.com/data4/MF/VN/MY-12203761/mix-fruit.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartList()));
            },
            child: Center(
              child: badges.Badge(
                badgeContent:
                    Consumer<CartProvider>(builder: (context, value, child) {
                  return Text(
                    value.getItemCount().toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                }),
                badgeStyle:
                    const badges.BadgeStyle(shape: badges.BadgeShape.circle),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productName.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  //color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(productImage[index].toString()),
                      ),
                      //const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName[index],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            productUnit[index] +
                                " " +
                                r"$" +
                                productPrice[index].toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              dbHelper
                                  .insertData(Cart(
                                      productId: index.toString(),
                                      productName:
                                          productName[index].toString(),
                                      initialPrice: productPrice[index],
                                      productPrice: productPrice[index],
                                      quantity: 1,
                                      unitTag: productUnit[index].toString(),
                                      image: productImage[index].toString()))
                                  .then((value) {
                                debugPrint('successfully added');
                                Utils().flashBarMessage(
                                    context, 'Successfully added');
                                cartProvider.addTotalPrice(double.parse(
                                    productPrice[index].toString()));
                                cartProvider.addItem();
                              }).onError((error, stackTrace) {
                                print(error
                                    .toString()
                                    .contains('UNIQUE constraint failed'));
                                debugPrint(error.toString());
                                Utils()
                                    .flashBarMessage(context, 'Already added');
                              });
                              debugPrint('working');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'Add To Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
