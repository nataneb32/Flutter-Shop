import 'package:meta/meta.dart';

class ShopItem{
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final String description;

  ShopItem({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.price,
    @required this.description,
  });
}