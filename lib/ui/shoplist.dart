
import 'package:flutter/material.dart';
import 'package:flutter_shop/repository/shopList.dart';

class ShopList extends StatelessWidget{
  List<ShopItem> shoplist;
  ShopList(){
    shoplist = ShopRepo.getList().map((e) => ShopItem(title: e.name, price: e.price, imageUrl: e.imageUrl,)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:  Column(
      children: shoplist
      ,),);
  }
  
}

class ShopItem extends StatelessWidget{
  final String title;
  final String price;
  final String imageUrl;

  ShopItem({@required this.title, @required this.price, @required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return 
        Container( 
          padding: EdgeInsets.all(10),
          height: 100,
          child:Row(
          children: <Widget>[
            Image.network(imageUrl,	
              height: 100,
              width: 150),
            Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
            Text(title),
            Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text(price,style: TextStyle(fontSize: 20),)],),

            ],),)
          ]
        ,)
      ,);
  }
}