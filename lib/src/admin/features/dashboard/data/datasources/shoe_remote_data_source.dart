import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sneakers/core/utils/common.dart';
import 'package:sneakers/src/admin/features/dashboard/data/models/shoe_model.dart';

abstract class ShoeRemoteDataSource {
  Future<void> addShoe({
    required String name,
    required String model,
    required double price,
    required String image,
    required String description,
    required Color backGroundColor,
    // required List<String> sizes,
  });
  Future<void> updateShoe({
    required String id,
    required String name,
    required String model,
    required double price,
    required String image,
    required String description,
    required Color backGroundColor,
    // required List<String> sizes,
  });
  Future<void> deleteShoe({required String id});
  Future<List<ShoeModel>> getShoes();
}

const kAddShoeEndpoint = '/shoes';

class ShoeRemoteDataSourceImp implements ShoeRemoteDataSource {
  Future<void> addShoe({
    required String name,
    required String model,
    required double price,
    required Color backGroundColor,
    required String description,
    required String image,
    // required List<String> sizes,
  }) async {
    try {
      final response = await Dio().post(
        '$baseUrl$kAddShoeEndpoint',
        data: jsonEncode({
          'name': name,
          'model': model,
          'price': price,
          'backGroundColor': backGroundColor.value,
          'description': description,
          'image': image,
          // 'sizes': sizes,
        }),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to post data");
      }
    } on DioException catch (e) {
      print('Error posting shoe: ${e.message}');
      throw e;
    }
  }

  Future<void> updateShoe({
    required String id,
    required String name,
    required String model,
    required double price,
    required Color backGroundColor,
    required String description,
    required String image,
    // required List<String> sizes,
  }) async {
    try {
      final response = await Dio().put(
        '$baseUrl$kAddShoeEndpoint/$id',
        data: jsonEncode({
          'id': id,
          'name': name,
          'model': model,
          'price': price,
          'backGroundColor': backGroundColor.value,
          'description': description,
          'image': image,
          // 'sizes': sizes,
        }),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to post data");
      }
    } on DioException catch (e) {
      print('Error posting shoe: ${e.message}');
      throw e;
    }
  }

  Future<void> deleteShoe({required String id}) async {
    try {
      Response response = await Dio().delete('$baseUrl$kAddShoeEndpoint/$id');
      if (response.statusCode != 200) {
        throw Exception("Failed to delete data");
      }
    } on DioException catch (e) {
      throw Exception("Error deleting shoe :${e.message}");
    }
  }

  Future<List<ShoeModel>> getShoes() async {
    try {
      final response = await Dio().get('$baseUrl$kAddShoeEndpoint');
      if (response.statusCode != 200) {
        throw Exception("Failed to get data");
      }
      return (response.data as List)
          .map((shoeData) => ShoeModel.fromMap(shoeData))
          .toList();
    } on DioException catch (e) {
      print('Error getting shoes: ${e.message}');
      throw e;
    }
  }
}
