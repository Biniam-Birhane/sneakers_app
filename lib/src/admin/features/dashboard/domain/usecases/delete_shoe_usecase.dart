import 'package:equatable/equatable.dart';
import 'package:sneakers/core/usecases/usecase.dart';
import 'package:sneakers/core/utils/typedef.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/repositories/shoe_repository.dart';

class DeleteShoeUseCase extends UsecaseWithParams<void, DeleteShoeParams> {
  DeleteShoeUseCase(this.repository);
  ShoeRepository repository;
  ResultVoid call(DeleteShoeParams params) async =>
      repository.deleteShoe(id: params.id);
}

class DeleteShoeParams extends Equatable {
  const DeleteShoeParams({required this.id});

  final String id;

  List<Object> get props => [id];
}
