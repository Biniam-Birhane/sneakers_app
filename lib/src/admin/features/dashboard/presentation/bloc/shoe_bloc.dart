import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/entities/shoe_entity.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/add_shoe_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/delete_shoe_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/get_shoes_usecase.dart';
import 'package:sneakers/src/admin/features/dashboard/domain/usecases/update_shoe_usecase.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc(
      {required AddShoeUseCase addShoe,
      required GetShoes getShoes,
      required UpdateShoeUseCase updateShoe,
      required DeleteShoeUseCase deleteShoe})
      : _addShoe = addShoe,
        _getShoes = getShoes,
        _updateShoe = updateShoe,
        _deleteShoe = deleteShoe,
        super(DashboardInitial()) {
    on<AddShoeEvent>(_addShoeEventHandler);
    on<GetShoesEvent>(_getShoesEventHandler);
    on<UpdateShoeEvent>(_updateShoeEventHandler);
    on<DeleteShoeEvent>(_deleteShoeEventHandler);
  }
  final AddShoeUseCase _addShoe;
  final GetShoes _getShoes;
  final UpdateShoeUseCase _updateShoe;
  final DeleteShoeUseCase _deleteShoe;
  Future<void> _addShoeEventHandler(
      AddShoeEvent event, Emitter<ShoeState> emit) async {
    emit(const AddingShoe());
    await _addShoe(AddShoeParams(
      backGroundColor: event.backGroundColor,
      description: event.description,
      image: event.image,
      model: event.model,
      name: event.name,
      price: event.price,
    ));
    emit(const ShoeAdded());
  }

  Future<void> _getShoesEventHandler(
      GetShoesEvent event, Emitter<ShoeState> emit) async {
    emit(GettingShoes());
    final shoes = await _getShoes();
    emit(ShoesLoaded(shoes));
  }

  Future<void> _updateShoeEventHandler(
      UpdateShoeEvent event, Emitter<ShoeState> emit) async {
    emit(GettingShoes());
    await _updateShoe(UpdateShoeParam(
      id: event.id,
      backGroundColor: event.backGroundColor,
      description: event.description,
      image: event.image,
      model: event.model,
      name: event.name,
      price: event.price,
    ));
    emit(const ShoeAdded());
  }

  Future<void> _deleteShoeEventHandler(
      DeleteShoeEvent event, Emitter<ShoeState> emit) async {
    // emit(GettingShoes());
    await _deleteShoe(DeleteShoeParams(id: event.id));
    emit(const ShoeDeleted());
  }
}
