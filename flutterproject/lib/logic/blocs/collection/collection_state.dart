part of 'collection_bloc.dart';

@immutable
sealed class CollectionState {}

final class CollectionInitial extends CollectionState {}

final class CollectionLoading extends CollectionState {}

final class CollectionLoaded extends CollectionState {
  final List<Car> pinnedCars;
  final List<Car> unPinnedCars;

  CollectionLoaded(this.pinnedCars, this.unPinnedCars);
}

final class CollectionEmpty extends CollectionState {}

final class CarPinnedSuccess extends CollectionState {
  final String title;

  CarPinnedSuccess(this.title);
}

final class CarRemovedSuccess extends CollectionState {
  final String title;

  CarRemovedSuccess(this.title);
}

final class CollectionError extends CollectionState {
  final String message;

  CollectionError(this.message);
}
