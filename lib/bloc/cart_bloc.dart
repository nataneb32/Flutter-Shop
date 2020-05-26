import 'dart:async';

import 'package:flutter_shop/model/cartItem.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc{
  List<CartItem> list = new List<CartItem>();
  CartBloc(){
    _ctrl.sink.add(list);
  }
  BehaviorSubject<List<CartItem>> _ctrl = new BehaviorSubject<List<CartItem>>();

  ValueStream<List<CartItem>> get stream => _ctrl.stream;

  void addToCart(CartItem c){
    int index = list.indexWhere((e) => e.item.id == c.item.id);
    print(index);
    if (index >= 0){
      list[index].quantity += c.quantity;
      _ctrl.sink.add(list);
    } else{
      list.add(c);
      _ctrl.sink.add(list);
    }
  }
}