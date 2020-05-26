import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/bloc/cart_bloc.dart';
import 'package:flutter_shop/model/cartItem.dart';
import 'package:flutter_shop/repository/shopList.dart';

class AddDialog{
  CartBloc cartBloc;
  CartItem item;
  

  AddDialog(CartBloc cartBloc){
    this.cartBloc = cartBloc;
  }

  Future<void> add(BuildContext context, String id) async{
    this.item = CartItem.withId(id, 1);
    await showDialog(context: context, builder: (BuildContext context) {
      return Dialog(item: item,cartBloc: cartBloc,);
    });
  } 
}


class Dialog extends StatefulWidget{
  CartItem item;
  CartBloc cartBloc;
  Dialog({@required this.item, @required this.cartBloc});
  @override
  State<StatefulWidget> createState() => _Dialog();
}

class _Dialog extends State<Dialog>{
  @override
  Widget build(BuildContext context) {
    return 
    SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(widget.item.imageUrl,fit: BoxFit.fill,),
        NumberField(number: widget.item.quantity,minus: () => minus(),plus: () => plus()),
        FlatButton(child: Text((widget.item.price * widget.item.quantity).toStringAsFixed(2)) ,onPressed: (){
          widget.cartBloc.addToCart(
            widget.item
          );
          Navigator.pop(context);
        },)
      ],
    );
    
  }

  void minus(){
    setState(() {
      widget.item.quantity--;
    });
  }

  void plus(){
    setState(() {
      widget.item.quantity++;
    });
  }
}


class NumberField extends StatelessWidget{
  int number;
  void Function() minus;
  void Function() plus;

  NumberField({@required this.number,@required this.minus,@required this.plus});

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      IconButton(icon: Icon(Icons.remove),onPressed: minus,),
      Text(number.toString()),
      IconButton(icon: Icon(Icons.add),onPressed: plus,)
    ],);
  }
}

class AddChartButton extends StatefulWidget{
  void Function() onPressed;

  AddChartButton({@required onPressed});
  @override
  State<StatefulWidget> createState() => _AddChartButton();
  
}

class _AddChartButton extends State<AddChartButton>{
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: widget.onPressed,);
  }
  
}