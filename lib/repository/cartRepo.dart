
import 'package:flutter_shop/repository/shopList.dart';

abstract class CartListenable{
  void notify(List<CartItem> n);

}

class CartItem{
  Item _shopItem;
  String description;

  CartItem(String id, {this.description}){
    _shopItem = ShopRepo.getByID(id);
  }

  String get name => _shopItem.name;
  String get imageUrl => _shopItem.imageUrl;
  String get id => _shopItem.id;
  String get price => _shopItem.price;

}

class CartRepo{

  static List<CartListenable> _listeners = List<CartListenable>();
  static List<CartItem> list = List<CartItem>();

  CartRepo._privateConstructor();

  factory CartRepo(){
    return instance;
  }

  static final CartRepo instance = CartRepo._privateConstructor();


  void update(){
    _listeners.forEach((el) {
      el.notify(list);
    });
  }

  void subscribe(CartListenable cl){
    print(cl);
    print(CartRepo._listeners);
    CartRepo._listeners.add(cl);
  }

  void unsubscribe(CartListenable cl){
    print(cl);
    CartRepo._listeners.remove(cl);
  }

  void addToCart(CartItem c){
    list.add(c);
    this.update();
  }

}