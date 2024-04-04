part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  const AddToCartEvent({required this.shoe});
  final Shoe shoe;
}

class DeleteFromCartEvent extends CartEvent {
  const DeleteFromCartEvent({required this.id});
  final String id;
}

class GettingCartItemsEvent extends CartEvent {
  const GettingCartItemsEvent();
}
