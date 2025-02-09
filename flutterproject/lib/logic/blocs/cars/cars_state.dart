// // Define the different states of the cars.
// part of 'cars_bloc.dart';

// @immutable
// sealed class CarsState extends Equatable {
//   const CarsState();

//   @override
//   List<Object> get props => [];
// }

// final class CarsInitial extends CarsState {}

// final class CarsLoading extends CarsState {}

// final class CarsLoaded extends CarsState {
//   final List<Car> cars;
//   final List<int> favoriteCars;

//   CarsLoaded(this.cars, this.favoriteCars);
// }

// final class CarLoadError extends CarsState {
//   final String error;

//   CarLoadError(this.error);
// }

// final class CarCreationSuccess extends CarsState {
//   final Car car;

//   CarCreationSuccess(this.car);
// }

// final class CarUpdateSuccess extends CarsState {
//   final Car car;

//   CarUpdateSuccess(this.car);
// }

// final class CarDeleteSuccess extends CarsState {
//   final Car car;

//   CarDeleteSuccess(this.car);
// }

// final class CarProcessingError extends CarsState {
//   final String error;

//   CarProcessingError(this.error);
// }

// final class CarToCollectionAddSuccess extends CarsState {
//   final String brand;

//   CarToCollectionAddSuccess(this.brand);
// }

// final class CarFromCollectionRemoveSuccess extends CarsState {
//   final String brand;

//   CarFromCollectionRemoveSuccess(this.brand);
// }
