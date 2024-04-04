import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
// import 'package:sneakers/cart/bloc/cart_event.dart';
// import 'package:sneakers/cart/bloc/cart_state.dart';
import 'package:sneakers/src/user/dashboard.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitState()) {
    on<AddToCartEvent>(_addToCartHandler);
    on<DeleteFromCartEvent>(_deleteFromCartHandler);
    on<GettingCartItemsEvent>(_gettingCartItemHandler);
  }
  List<Shoe> shoes = [];
  double totalPrice = 0;
  void _addToCartHandler(AddToCartEvent event, Emitter<CartState> emit) {
    emit(CartGetting());
    shoes.add(event.shoe);
    totalPrice = 0;
    for (var i = 0; i < shoes.length; i++) {
      totalPrice = totalPrice + shoes[i].price;
    }
    emit(CartLoaded(shoe: shoes, totalPrice: totalPrice));
  }

  void _deleteFromCartHandler(
      DeleteFromCartEvent event, Emitter<CartState> emit) {
    shoes.removeWhere((shoe)=>shoe.id==event.id);
    totalPrice = 0;
    for (var i = 0; i < shoes.length; i++) {
      totalPrice = totalPrice + shoes[i].price;
    }
    emit(CartLoaded(shoe: shoes, totalPrice: totalPrice));
  }

  void _gettingCartItemHandler(
      GettingCartItemsEvent event, Emitter<CartState> emit) {
    emit(CartGetting());
    // print()
    emit(CartLoaded(shoe: shoes, totalPrice: totalPrice));
  }
}
