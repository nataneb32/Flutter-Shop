import 'package:flutter/widgets.dart';
import 'package:flutter_shop/repository/cartRepo.dart';


class Cart extends StatefulWidget {
  List<CartItem> list = CartRepo.list;

  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> implements CartListenable{
  final CartRepo cartRepo = CartRepo();
  _Cart(){
    this.cartRepo.subscribe(this);
  }
  
  @override
  void dispose() {
    cartRepo.unsubscribe(this);
    super.dispose();
  }

  @override
  void notify(List<CartItem> n) {
    setState(() {
          widget.list = n;
    });
    print(n);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
      Padding(padding: EdgeInsets.all(10),child: 
        Column(children: 
          CartRepo.list.map((e) => CartListItemWidget(description: e.description?? "",imageUrl: e.imageUrl,)).toList()
        ,)
      ,)
    ,);
  }
}

class CartListItemWidget extends StatelessWidget{
  final String description;
  final String imageUrl;

  CartListItemWidget({@required this.description,@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image.network(
        imageUrl,
        width: 100,
        height: 100
        ,),
      Text(description),
    
    ],);
  }
}