import 'dart:ui';

import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/data/datasources/shoe_remote_data_source.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';

class ShoeRepositoryimplimentation implements ShoeRepository {
  const ShoeRepositoryimplimentation(this.remoteDataSource);
  final ShoeRemoteDataSource remoteDataSource;
  @override
  ResultFuture<List<Shoe>> getShoes() async {
    try {
      final result = await remoteDataSource.getShoes();
      return result;
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  ResultVoid addShoe(
      {required String name,
      required String model,
      required String image,
      required double price,
      required String description,
      // required List<String> size,
      required Color backGroundColor}) async {
    try {
      await remoteDataSource.addShoe(
          name: name,
          model: model,
          image: image,
          price: price,
          description: description,
          // sizes: size,
          backGroundColor: backGroundColor);
    } on Exception catch (e) {
      throw e;
    }
  }

  ResultVoid updateShoe(
      {required String id,
      required String name,
      required String model,
      required String image,
      required double price,
      required String description,
      // required List<String> size,
      required Color backGroundColor}) async {
    try {
      await remoteDataSource.updateShoe(
          id: id,
          name: name,
          model: model,
          image: image,
          price: price,
          description: description,
          // sizes: size,
          backGroundColor: backGroundColor);
    } on Exception catch (e) {
      throw e;
    }
  }

  ResultVoid deleteShoe({required String id}) async {
    try {
      await remoteDataSource.deleteShoe(id: id);
    } on Exception catch (e) {
      throw e;
    }
  }
}
