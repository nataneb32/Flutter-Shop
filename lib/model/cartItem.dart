import 'package:flutter_shop/model/shopItem.dart';
import 'package:flutter_shop/repository/shopList.dart';
import 'package:meta/meta.dart';


class CartItem{
  int quantity;
  final ShopItem item;
  
  CartItem({
    @required this.item,
    this.quantity = 1
  });

  get price => item.price;
  get name => item.name;
  get imageUrl => item.imageUrl;
  get id => item.price;
  get description => item.description;

  factory CartItem.withId(String id, int quantity){
    ShopRepo shopRepo = ShopRepo();
    try{
      ShopItem item = shopRepo.getByID(id);
      return CartItem(item: item,quantity: quantity);
    }catch(err){
      return null;
    }
  }
}