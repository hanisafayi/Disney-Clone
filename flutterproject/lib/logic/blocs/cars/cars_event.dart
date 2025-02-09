// part of 'cars_bloc.dart';

// @immutable
// sealed class CarsEvent {}

// class CarsLoadEvent extends CarsEvent {
//   final int? userId;
//   final int flag;

//   CarsLoadEvent(this.userId, {this.flag = 0});
// }

// class CreateCarEvent extends CarsEvent {
//   final String brand;
//   final String condition;
//   final String model;
//   final String price;
//   final String id;
//   final String images;
//   final String token;

//   CreateCarEvent({
//     required this.brand,
//     required this.condition,
//     required this.model,
//     required this.price,
//     required this.id,
//     required this.images,
//     required this.token,
//   });
// }

// class UpdateCarEvent extends CarsEvent {
//   final int id;
//   final String brand;
//   final String condition;
//   final String model;
//   final String price;
//   final String images;
//   final String token;

//   UpdateCarEvent({
//     required this.id,
//     required this.brand,
//     required this.condition,
//     required this.model,
//     required this.price,
//     required this.images,
//     required this.token,
//   });
// }

// class DeleteCarEvent extends CarsEvent {
//   final Car car;
//   final String token;

//   DeleteCarEvent({
//     required this.car,
//     required this.token,
//   });
// }

// class AddCarToCollection extends CarsEvent {
//   final Car car;
//   final int userId;
//   final int flag;

//   AddCarToCollection(this.car, this.userId, {this.flag = 0});
// }

// class RemoveACarFromCollection extends CarsEvent {
//   final Car car;
//   final int userId;
//   final int flag;

//   RemoveACarFromCollection(this.car, this.userId, {this.flag = 0});
// }
