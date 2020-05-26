import 'package:flutter_shop/model/cartItem.dart';
import 'package:flutter_shop/repository/cartRepo.dart';
import 'package:test/test.dart';

void main() {
  test('CartRepo should add', () {
    final cartRepo = CartRepo();
    final cartItem = CartItem("1",annotations: "",amount: 1);
    cartRepo.addToCart(cartItem);
    cartRepo.addToCart(CartItem("2",annotations: "",amount: 1));

    expect(CartRepo.list, contains(cartItem));
    expect(CartRepo.list.length, 1);
  });
  test('CartRepo should add', () {
    final cartRepo = CartRepo();
    final cartItem = CartItem("1",annotations: "",amount: 1);
    final cartItem2 = CartItem("1",annotations: "",amount: 1);

    cartRepo.addToCart(cartItem);

    expect(CartRepo.list, contains(cartItem));
    expect(CartRepo.list.length, 1);
  });
}