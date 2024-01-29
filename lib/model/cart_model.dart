import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shop_items =[
    ["Avocado","250.00","assets/images/avocado.png",Colors.green],
    ["Banana","40.00","assets/images/banana.png",Colors.yellow],
    ["Chicken","150.00","assets/images/chicken.png",Colors.brown],
    ["Water","15.00","assets/images/water.png",Colors.blue],
    ];

    List _cartItems=[];

    get shopItems => _shop_items;
    get cartItems => _cartItems;
    void addItemtoCart(int index){
      _cartItems.add(_shop_items[index]);
      notifyListeners();
    }

    void removeItemfromCart(int index){
      _cartItems.removeAt(index);
      notifyListeners();
    }

    String calTot(){
      double totPrice =0;
      for(int i=0;i<_cartItems.length;i++){
        totPrice+=double.parse(_cartItems[i][1]);
      }
      return totPrice.toStringAsFixed(2);
    }

    
}