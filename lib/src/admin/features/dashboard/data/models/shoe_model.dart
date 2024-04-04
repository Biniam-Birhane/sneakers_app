import 'dart:convert';

import 'dart:ui';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';

class ShoeModel extends Shoe {
  const ShoeModel({
    required String id,
    required String name,
    required String model,
    required double price,
    required String image,
    required Color backGroundColor,
    required String description,
    // required List<String?> sizes,
  }) : super(
          id: id,
          name: name,
          model: model,
          price: price,
          image: image,
          backGroundColor: backGroundColor,
          description: description,
          // sizes: sizes,
        );

  factory ShoeModel.fromJson(String source) =>
      ShoeModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
        id: map['id'] as String,
        name: map['name'] as String,
        model: map['model'] as String,
        price: (map['price'] as num).toDouble(),
        image: map['image'] as String,
        backGroundColor: Color(map['backGroundColor'] as int),
        description: map['description'] as String);
    // sizes: map['sizes'] as List<String>);

    // sizes: (map['sizes'] as List<dynamic>)
    //     .map((size) => size.toString())
    //     .toList(),
  }

  ShoeModel copyWith({
    String? id,
    String? name,
    String? model,
    double? price,
    String? image,
    Color? backGroundColor,
    String? description,
    // List<String?>? sizes,
  }) {
    return ShoeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      price: price ?? this.price,
      image: image ?? this.image,
      backGroundColor: backGroundColor ?? this.backGroundColor,
      description: description ?? this.description,
      // sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'price': price,
      'image': image,
      'backGroundColor':
          backGroundColor.value, // Convert Color to int
      'description': description,
      // 'sizes': sizes,
    };
  }

  String toJson() => jsonEncode(toMap());
}
