import 'package:flutter/material.dart';
import 'package:flutter_shop/repository/shopList.dart';
import 'package:flutter_shop/ui/cart/add_to_cart_dialog.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/ui/shoplist/searchBar.dart';

class ShopList extends StatelessWidget {
  List<ShopItem> shoplist;

  ShopList() {
    shoplist = ShopRepo()
        .getList()
        .map((e) => ShopItem(
            title: e.name,
            price: e.price.toStringAsFixed(2),
            imageUrl: e.imageUrl,
            description: e.description,
            onPressed: (BuildContext context) =>
                AddDialog(CartProvider.of(context).data).add(context, e.id)))
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: shoplist,
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  final void Function(BuildContext context) onPressed;
  final String title;
  final String price;
  final String description;
  final String imageUrl;

  ShopItem(
      {@required this.title,
      @required this.price,
      @required this.imageUrl,
      @required this.onPressed,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(10),
        height: 130,
        child: Row(
          children: <Widget>[
            Image.network(imageUrl, fit: BoxFit.cover, height: 90, width: 120),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(title),
                    Text(
                      description ?? "",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            onPressed(context);
                          },
                          child: Row(children: [
                            Text(price + "R\$"),
                            Icon(Icons.add_shopping_cart),
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Divider()
    ]);
  }
}
