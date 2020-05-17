import 'package:flutter/material.dart';
import 'package:flutter_shop/repository/cartRepo.dart';


class MainScaffold extends StatefulWidget{
    final Widget shopList;
  final Widget cart;
  final Widget ongoing;
  int currentIndex = 0;
  MainScaffold({@required this.shopList, @required this.cart, @required this.ongoing});

  @override
  _MainScaffold createState() => _MainScaffold();
}

class _MainScaffold extends State<MainScaffold>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop"),actions: <Widget>[
        IconButton(onPressed: appbarUserClick, icon: Icon(Icons.account_circle),)
      ],),
      body: currentBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapDrawer,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),title: Text("Buy")),
          BottomNavigationBarItem(icon: Icon(Icons.timer), title: Text("On-going")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Cart"))
          ],
          currentIndex: widget.currentIndex,
        ),
    );
  }

  void appbarUserClick(){
    CartRepo.instance.addToCart(CartItem("1"));
  }

  void onTapDrawer(int index){
    setState(() {
      widget.currentIndex = index;
    });
  }

  Widget currentBody(){
    if (widget.currentIndex == 0){
      return widget.shopList;
    }
    if (widget.currentIndex == 1){
      return widget.ongoing;
    }
    if (widget.currentIndex == 2){
      return widget.cart;
    }
  }
}