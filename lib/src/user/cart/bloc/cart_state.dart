part of 'cart_bloc.dart';

class CartState {
  const CartState();
}

class InitState extends CartState {}

class CartGetting extends CartState {}

class CartLoaded extends CartState {
  const CartLoaded({required this.shoe, required this.totalPrice});
  final List<Shoe> shoe;
  final double totalPrice;
}
