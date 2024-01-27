import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _itemCounter = 0;
  double _totalPrice = 0.0;

  int get itemCounter => _itemCounter;
  double get totalPrice => _totalPrice;

  void setPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cart_item', _itemCounter);
    pref.setDouble('cart_price', _totalPrice);
    notifyListeners();
  }

  void getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _itemCounter = pref.getInt('cart_item') ?? 0;
    _totalPrice = pref.getDouble('cart_price') ?? 0;

    notifyListeners();
  }

////////////////////////////// item counter ////////////////////////////////////
  void addItem() {
    _itemCounter++;
    setPref();
    notifyListeners();
  }

  void removeItem() {
    _itemCounter--;
    setPref();
    notifyListeners();
  }

  int getItemCount() {
    getPref();
    return _itemCounter;
  }

/////////////////////////// total product price ////////////////////////////////

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    setPref();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    setPref();
    notifyListeners();
  }

  double getTotalPrice() {
    getPref();
    return _totalPrice;
  }
}
