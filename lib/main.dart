import 'package:flutter/material.dart';
import 'package:flutter_shop/bloc/cart_bloc.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/ui/cart/cart.dart';
import 'package:flutter_shop/ui/ongoing/ongoing.dart';
import 'package:flutter_shop/ui/scaffold.dart';
import 'package:flutter_shop/ui/shoplist/shoplist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      data: CartBloc(),
      child: MaterialApp(
        title: 'Flutter Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScaffold(
            shopList: ShopList(), ongoing: Ongoing(), cart: Cart()),
      ),
    );
  }
}
