import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/bloc/cart_bloc.dart';
import 'package:flutter_shop/model/cartItem.dart';
import 'package:flutter_shop/provider/cart_provider.dart';


class Cart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart>{
  final CartBloc cartBloc = CartBloc();
  _Cart(){
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
      Padding(padding: EdgeInsets.all(10),child: 
          StreamBuilder<List<CartItem>>(
            stream: CartProvider.of(context).data.stream,
            builder: (ctx, value){
              return Column(children: value.data.map((e) => CartListItemWidget(name:e.item.name,price: e.item.price*e.quantity,imageUrl: e.item.imageUrl,)).toList(),);
            },
            ),
      )
    ,);
  }
}

class CartListItemWidget extends StatelessWidget{
  final String imageUrl;
  final String name;
  final double price;

  CartListItemWidget({@required this.price,@required this.imageUrl, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container( 
        padding: EdgeInsets.all(10),
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Image.network(
        imageUrl,
        width: 100,
        ),
        Expanded(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(name),
          Text(price.toStringAsFixed(2)),
      ],),)
    ],),),);
  }
}