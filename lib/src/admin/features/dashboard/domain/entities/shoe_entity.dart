import 'dart:ui';

import 'package:equatable/equatable.dart';

class Shoe extends Equatable {
  const Shoe(
      {required this.id,
      required this.name,
      required this.model,
      required this.price,
      required this.backGroundColor,
      required this.image,
      required this.description,
      });
  final String id;
  final String name;
  final String model;
  final double price;
  final Color backGroundColor;
  final String image;
  final String description;
  // final List<String?> sizes;

  List<Object> get props => [id];
}
