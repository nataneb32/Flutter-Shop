import 'package:flutter/material.dart';
import 'package:flutter_shop/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget{
  final CartBloc data;

  CartProvider({
    Widget child,
    this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(CartProvider oldWidget) => data != oldWidget.data;

  static CartProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CartProvider>();


}