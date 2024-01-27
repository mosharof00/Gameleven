import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier {
  dynamic itemList = [
    {
      'id': 1,
      'name': 'Power Bank Water Gold Sound Box',
      'sub_title':
          "Strategies de Survie des Populations Africaines dans une Economie Mondialisée - L’expérience Camerounaise.",
      'image': {
        'little_size': 'assets/images/headphone_2.jpg',
        'big_size': 'assets/images/headphone_2.jpg'
      },
      'price': '46,0000.00 XAF',
      'category': 'Electronics Device',
      'subcategory': 'Gaming Device',
      'special_price': 550.00,
      'details':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'specification':
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,",
      'is_favorite': false,
      'in_cart': false,
      'in_checkout': false,
      'cart_count': 1,
    },
    {
      'id': 2,
      'name': 'Power Bank Water Gold Sound Box',
      'sub_title':
          "Strategies de Survie des Populations Africaines dans une Economie Mondialisée - L’expérience Camerounaise.",
      'image': {
        'little_size': 'assets/images/chair.jpg',
        'big_size': 'assets/images/chair.jpg'
      },
      'category': 'Electronics Device',
      'subcategory': 'Gaming Device',
      'price': '46,0000.00 XAF',
      'special_price': 550.00,
      'details':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'specification':
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,",
      'is_favorite': false,
      'in_cart': false,
      'in_checkout': false,
      'cart_count': 1
    },
    {
      'id': 3,
      'name': 'Power Bank Water Gold Sound Box',
      'sub_title':
          "Strategies de Survie des Populations Africaines dans une Economie Mondialisée - L’expérience Camerounaise.",
      'image': {
        'little_size': 'assets/images/gaming_pc.png',
        'big_size': 'assets/images/gaming_pc.png'
      },
      'category': 'Electronics Device',
      'subcategory': 'Gaming Device',
      'price': '46,0000.00 XAF',
      'special_price': 550.00,
      'details':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'specification':
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,",
      'is_favorite': false,
      'in_cart': false,
      'in_checkout': false,
      'cart_count': 1
    },
    {
      'id': 4,
      'name': 'Power Bank Water Gold Sound Box',
      'sub_title':
          "Strategies de Survie des Populations Africaines dans une Economie Mondialisée - L’expérience Camerounaise.",
      'image': {
        'little_size': 'assets/images/gaming_mouse.jpg',
        'big_size': 'assets/images/gaming_mouse.jpg'
      },
      'category': 'Electronics Device',
      'subcategory': 'Gaming Device',
      'price': '46,0000.00 XAF',
      'special_price': 550.00,
      'details':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      'specification':
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,",
      'is_favorite': false,
      'in_cart': false,
      'in_checkout': false,
      'cart_count': 1
    },
  ];

  ///////////////////////////==Filtered by category==////////////////////////

  // List<dynamic> filteredProductsByCategory(String category) {
  //   return itemList.where((product) => product['category'] == category).toList();
  // }

  //
  // List<dynamic> filteredProductsByCategory(String category, String subcategory) {
  //   return itemList.where((product) =>
  //   product['category'] == category && product['subcategory'] == subcategory
  //   ).toList();
  // }

  ////////////////////////// ==only for wishlist== /////////////////////////
  List _wishlist = [];

  List get wishlists => _wishlist;

  void setToWishlistItem(item) {
    if (item["is_favorite"]) {
      _wishlist.add(item);
    } else {
      _wishlist.remove(item);
    }
    print(_wishlist.length);
    print(wishlists);
    notifyListeners();
  }

  void removeToWishlist(item) {
    itemList.asMap().forEach((ind, value) => {
          if (item["id"] == value["id"])
            {_wishlist.remove(item), itemList[ind]['is_favorite'] = false}
        });
    notifyListeners();
  }

  void setIsFavorite(index) {
    if (itemList[index]['is_favorite']) {
      itemList[index]['is_favorite'] = false;
      setToWishlistItem(itemList[index]);
    } else {
      itemList[index]['is_favorite'] = true;
      setToWishlistItem(itemList[index]);
    }
    notifyListeners();
  }

//////////////////////////////==only fo cart==//////////////////////////////////

  List _cartList = [];

  List get cartList => _cartList;

  void addToCartItem(item) {
    if (item["in_cart"]) {
      _cartList.add(item);
    } else {
      _cartList.remove(item);
    }
    print(_cartList.length);
    print(cartList);
    notifyListeners();
  }

  void removeFromCart(item) {
    itemList.asMap().forEach((ind, value) => {
          if (item["id"] == value["id"])
            {_cartList.remove(item), itemList[ind]['in_cart'] = false},
        });
    notifyListeners();
  }

  void setAddToCart(index) {
    if (itemList[index]['in_cart']) {
      itemList[index]['in_cart'] = false;
      addToCartItem(itemList[index]);
    } else {
      itemList[index]['in_cart'] = true;
      addToCartItem(itemList[index]);
    }
    notifyListeners();
  }

  addItem(index) {
    itemList[index]['cart_count']++;
    notifyListeners();
  }

  void removeItem(index) {
    itemList[index]['cart_count'] == 1 ? 1 : itemList[index]['cart_count']--;
    notifyListeners();
  }

  ////////////////////==only for checkout==//////////////////////////////////////

  List _checkout = [];

  List get checkout => _checkout;

  void checkoutItem(item) {
    if (item['in_checkout']) {
      _checkout.add(item);
    } else {
      _checkout.remove(item);
    }
    print('this is checkout');
    print(_checkout.length);
    print(checkout);
    notifyListeners();
  }

  void removeFromCheckout(item) {
    _cartList.asMap().forEach((ind, value) => {
          if (item["id"] == value["id"])
            {_checkout.remove(item), _cartList[ind]['in_checkout'] = false}
        });
    notifyListeners();
  }

  void setIsCheckout(index) {
    if (itemList[index]['in_checkout']) {
      itemList[index]['in_checkout'] = false;
      checkoutItem(_cartList[index]);
    } else {
      itemList[index]['in_checkout'] = true;
      checkoutItem(itemList[index]);
    }
    notifyListeners();
  }

  // void allInCheckout(index){
  //   _cartList[index]['in_checkout'] = true;
  //   checkoutItem(_cartList[index]);
  // }

  /////////////////////////////===get total of checkout===////////////////////////
  double getTotalPrice() {
    return _checkout
        .map((item) => item['special_price'] * item['cart_count'])
        .fold(0.0, (a, b) => a + b);
  }

  double totalWithAll() {
    return getTotalPrice() + 1000;
  }
}
