part of 'shoe_bloc.dart';

abstract class ShoeState extends Equatable {
  const ShoeState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends ShoeState {}

class GettingShoes extends ShoeState {
  const GettingShoes();
}

class ShoesLoaded extends ShoeState {
  const ShoesLoaded(this.shoes);
  final List<Shoe> shoes;

  List<Object> get props => shoes.map((shoe) => shoe.id).toList();
}

class AddingShoe extends ShoeState {
  const AddingShoe();
}
class ShoeAdded extends ShoeState {
  const ShoeAdded();
}

class ShoeUpdated extends ShoeState{
  const ShoeUpdated();
}

class ShoeDeleted extends ShoeState{
  const ShoeDeleted();
}


