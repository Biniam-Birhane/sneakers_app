part of 'shoe_bloc.dart';

abstract class ShoeEvent extends Equatable {
  const ShoeEvent();

  @override
  List<Object> get props => [];
}

class GetShoesEvent extends ShoeEvent {
  const GetShoesEvent();
}

class AddShoeEvent extends ShoeEvent {
  const AddShoeEvent(
      {required this.backGroundColor,
      required this.description,
      required this.image,
      required this.model,
      required this.name,
      required this.price});
  // required this.sizes});

  final String name;
  final String model;
  final double price;
  final Color backGroundColor;
  final String description;
  final String image;
  // final List<String> sizes;

  List<Object> get props =>
      [name, model, price, backGroundColor, description, image];
}

class UpdateShoeEvent extends ShoeEvent {
  const UpdateShoeEvent(
      {required this.id,
      required this.backGroundColor,
      required this.description,
      required this.image,
      required this.model,
      required this.name,
      required this.price});
  final String id;
  final String name;
  final String model;
  final double price;
  final Color backGroundColor;
  final String description;
  final String image;

  List<Object> get props => [id];
}

class DeleteShoeEvent extends ShoeEvent {
  const DeleteShoeEvent({required this.id});

  final String id;

  List<Object> get props => [id];
}
