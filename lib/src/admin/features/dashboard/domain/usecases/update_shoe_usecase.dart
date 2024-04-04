import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:sneakers/core/usecases/usecase.dart';
import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';

class UpdateShoeUseCase extends UsecaseWithParams<void, UpdateShoeParam> {
  UpdateShoeUseCase(this._repository);
  ShoeRepository _repository;
  ResultVoid call(UpdateShoeParam params) async => _repository.updateShoe(
      id: params.id,
      name: params.name,
      model: params.model,
      price: params.price,
      backGroundColor: params.backGroundColor,
      description: params.description,
      image: params.image);
  // size: params.sizes);
}

class UpdateShoeParam extends Equatable {
  const UpdateShoeParam(
      {required this.id,
      required this.backGroundColor,
      required this.description,
      required this.image,
      required this.model,
      required this.name,
      required this.price});
  // required this.sizes});
  final String id;
  final String name;
  final String model;
  final double price;
  final Color backGroundColor;
  final String description;
  final String image;
  // final List<String> sizes;

  List<Object> get props =>
      [id,name, model, price, backGroundColor, description, image];
}
