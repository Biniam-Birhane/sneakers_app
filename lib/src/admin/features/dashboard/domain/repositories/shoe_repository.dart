import 'dart:ui';

import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';

abstract class ShoeRepository {
  ResultFuture<List<Shoe>> getShoes();

  ResultVoid addShoe(
      {required String name,
      required String model,
      required double price,
      required Color backGroundColor,
      required String description,
      required String image});
  ResultVoid updateShoe(
      {required String id,
      required String name,
      required String model,
      required double price,
      required Color backGroundColor,
      required String description,
      required String image});

  ResultVoid deleteShoe({required String id});
  // required List<String> size});
}
