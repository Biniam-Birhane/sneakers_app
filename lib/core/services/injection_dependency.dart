import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers/src/admin/features/dashboard/data/datasources/shoe_remote_data_source.dart';
import 'package:sneakers/src/admin/features/dashboard/data/repositories/shoe_repository_implimentation.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/add_shoe_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/delete_shoe_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/get_shoes_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/update_shoe_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/presentation/bloc/shoe_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl
    ..registerFactory(() => ShoeBloc(
          addShoe: sl(),
          getShoes: sl(),
          updateShoe: sl(),
          deleteShoe: sl(),
        ))
    ..registerLazySingleton(() => AddShoeUseCase(sl()))
    ..registerLazySingleton(() => GetShoes(sl()))
    ..registerLazySingleton(() => UpdateShoeUseCase(sl()))
    ..registerLazySingleton(() => DeleteShoeUseCase(sl()))

    ..registerLazySingleton<ShoeRepository>(
        () => ShoeRepositoryimplimentation(sl()))
    ..registerLazySingleton<ShoeRemoteDataSource>(
        () => ShoeRemoteDataSourceImp())
    ..registerLazySingleton(Dio.new);
}
