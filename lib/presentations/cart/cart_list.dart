import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gameleven/presentations/cart/cart_model.dart';
import 'package:gameleven/presentations/cart/cart_provider.dart';
import 'package:gameleven/presentations/cart/db_helper.dart';
// import 'package:myapp/cart_model.dart';
// import 'package:myapp/cart_provider.dart';
// import 'package:myapp/db_helper.dart';
import 'package:provider/provider.dart';

class CartList extends StatefulWidget {
  CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart list'),
        centerTitle: true,
        actions: [
          Center(
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
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: dbHelper.getCartData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(snapshot
                                          .data![index].image
                                          .toString()),
                                    ),
                                    //const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data![index].productName.toString()} x ${snapshot.data![index].quantity}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          snapshot.data![index].unitTag
                                                  .toString() +
                                              " " +
                                              r"$" +
                                              snapshot.data![index].initialPrice
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              dbHelper.delete(
                                                  snapshot.data![index].id);
                                              cartProvider.removeItem();
                                              cartProvider.removeTotalPrice(
                                                  double.parse(snapshot
                                                      .data![index].productPrice
                                                      .toString()));
                                            },
                                            child: Icon(Icons.delete)),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    print('wor');
                                                    int quantity = snapshot
                                                        .data![index].quantity!;
                                                    int price = snapshot
                                                        .data![index]
                                                        .initialPrice!;
                                                    quantity--;
                                                    int? newPrice =
                                                        price * quantity;
                                                    print(quantity);

                                                    if (quantity > 0) {
                                                      dbHelper
                                                          .updatedQuentity(Cart(
                                                              id: snapshot
                                                                  .data![index]
                                                                  .id!,
                                                              productId: snapshot
                                                                  .data![index]
                                                                  .id!
                                                                  .toString(),
                                                              productName: snapshot
                                                                  .data![index]
                                                                  .productName!,
                                                              initialPrice: snapshot
                                                                  .data![index]
                                                                  .initialPrice!,
                                                              productPrice:
                                                                  newPrice,
                                                              quantity:
                                                                  quantity,
                                                              unitTag: snapshot
                                                                  .data![index]
                                                                  .unitTag
                                                                  .toString(),
                                                              image: snapshot
                                                                  .data![index]
                                                                  .image
                                                                  .toString()))
                                                          .then((value) {
                                                        print(newPrice);
                                                        print(quantity);
                                                        newPrice = 0;
                                                        quantity = 0;
                                                        cartProvider.removeTotalPrice(
                                                            double.parse(snapshot
                                                                .data![index]
                                                                .initialPrice!
                                                                .toString()));
                                                      }).onError((error,
                                                              stackTrace) {
                                                        print(error.toString());
                                                      });
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  )),
                                              Text(
                                                  snapshot.data![index].quantity
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              InkWell(
                                                  onTap: () {
                                                    int quantity = snapshot
                                                        .data![index].quantity!;
                                                    int price = snapshot
                                                        .data![index]
                                                        .initialPrice!;
                                                    quantity++;
                                                    int? newPrice =
                                                        price * quantity;

                                                    dbHelper
                                                        .updatedQuentity(Cart(
                                                            id: snapshot
                                                                .data![index]
                                                                .id!,
                                                            productId: snapshot
                                                                .data![index]
                                                                .id!
                                                                .toString(),
                                                            productName: snapshot
                                                                .data![index]
                                                                .productName!,
                                                            initialPrice: snapshot
                                                                .data![index]
                                                                .initialPrice!,
                                                            productPrice:
                                                                newPrice,
                                                            quantity: quantity,
                                                            unitTag: snapshot
                                                                .data![index]
                                                                .unitTag
                                                                .toString(),
                                                            image: snapshot
                                                                .data![index]
                                                                .image
                                                                .toString()))
                                                        .then((value) {
                                                      print(newPrice);
                                                      print(quantity);
                                                      newPrice = 0;
                                                      quantity = 0;

                                                      cartProvider
                                                          .addTotalPrice(double
                                                              .parse(snapshot
                                                                  .data![index]
                                                                  .initialPrice!
                                                                  .toString()));
                                                    }).onError((error,
                                                            stackTrace) {
                                                      print(error.toString());
                                                    });
                                                  },
                                                  child: Icon(Icons.add))
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        });
                  } else {
                    return Center(
                      child: Text('Loading...'),
                    );
                  }
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.deepOrange.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sub-Total: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Consumer<CartProvider>(builder: (context, value, child) {
                  return Text(
                    r'$' + value.totalPrice.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
