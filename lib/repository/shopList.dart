import 'dart:ffi';

import 'package:flutter_shop/model/shopItem.dart';

class ShopRepo {
  final List<ShopItem> mock = <ShopItem>[
    ShopItem(
        id: "1",
        name: "Hamburger 1",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 10.0,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "2",
        name: "Hamburger 2",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 32,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "3",
        name: "Hamburger 3",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 12,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "1",
        name: "Hamburger 1",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 10.0,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "2",
        name: "Hamburger 2",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 32,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "3",
        name: "Hamburger 3",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 12,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "2",
        name: "Hamburger 2",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 32,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "3",
        name: "Hamburger 3",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 12,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "1",
        name: "Hamburger 1",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 10.0,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "2",
        name: "Hamburger 2",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 32,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
    ShopItem(
        id: "3",
        name: "Hamburger 3",
        description: "Bread, 180g Mix Artesanal Meat, Cheese and Tomate",
        price: 12,
        imageUrl:
            "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
  ];

  ShopRepo._privateConstructor();
  static final ShopRepo _instance = ShopRepo._privateConstructor();

  factory ShopRepo() {
    return _instance;
  }

  List<ShopItem> getList() {
    return this.mock;
  }

  ShopItem getByID(String id) {
    return this.mock.firstWhere((element) => element.id == id);
  }
}
