import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/bloc/cart_bloc.dart';
import 'package:flutter_shop/model/cartItem.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_picker/flutter_picker.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Cart();
}

class _Cart extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  _Cart() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<List<CartItem>>(
          stream: CartProvider.of(context).data.stream,
          initialData: [],
          builder: (ctx, value) {
            return Column(
              children: value.data
                  .map((e) => CartListItemWidget(
                      name: e.item.name,
                      price: e.item.price * e.quantity,
                      imageUrl: e.item.imageUrl,
                      quantity: e.quantity))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class CartListItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final int quantity;

  CartListItemWidget(
      {@required this.price,
      @required this.imageUrl,
      @required this.name,
      @required this.quantity});

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 0, end: 999),
        ]),
        delimiter: [],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 90,
            width: 120,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name),
                  Text(price.toStringAsFixed(2)),
                ],
              ),
            ),
          ),
          Center(
              child: IconButton(
            icon: Text(quantity.toString() + "X"),
            onPressed: () {
              this.showPickerNumber(context);
            },
          )),
          Center(
            child: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
