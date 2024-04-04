import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:sneakers/core/usecases/usecase.dart';
import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';

class AddShoeUseCase extends UsecaseWithParams<void, AddShoeParams> {
  AddShoeUseCase(this._repository);
  ShoeRepository _repository;
  ResultVoid call(AddShoeParams params) async => _repository.addShoe(
      name: params.name,
      model: params.model,
      price: params.price,
      backGroundColor: params.backGroundColor,
      description: params.description,
      image: params.image);
  // size: params.sizes);
}

class AddShoeParams extends Equatable {
  const AddShoeParams(
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
