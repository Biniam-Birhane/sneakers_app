import 'package:sneakers/core/usecases/usecase.dart';
import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';

class GetShoes extends UsecaseWithOutParams<List<Shoe>> {
  GetShoes(this._repository);
   ShoeRepository _repository;
  ResultFuture<List<Shoe>> call() async => _repository.getShoes();
}
