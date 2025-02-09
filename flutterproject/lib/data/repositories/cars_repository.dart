import 'dart:convert';

import '../../models/car.dart';

import '../data_providers/cars_data_provider.dart';

class CarsRepository {
  final CarsDataProvider _carsDataProvider;

  CarsRepository(this._carsDataProvider);

  Future<List<Car>> getCars() async {
    final response = await _carsDataProvider.getCars();
    final cars = jsonDecode(response);
    final allCars = <Car>[];
    for (final car in cars) {
      allCars.add(car);
    }
    return allCars;
  }

  Future<Car> getCar(int id) async {
    final response = await _carsDataProvider.getCarById(id.toString());
    final car = jsonDecode(response);
    return (car);
  }

  Future<void> createCar(Car car, String token) async {
    await _carsDataProvider.addCar({
      'id': car.id,
      'brand': car.brand,
      'condition': car.condition,
      'model': car.model,
      'price': car.price,
      // 'imageUrl': car.imagesUrl,
    }, token);
  }

  Future<void> updateCar(Car car, String token) async {
    await _carsDataProvider.updateCar({
      'id': car.id,
      'brand': car.brand,
      'condition': car.condition,
      'model': car.model,
      'price': car.price,
      // 'imageUrl': car.imageUrl,
    }, token);
  }

  Future<void> deleteCar(int id, String token) async {
    await _carsDataProvider.deleteCar(id.toString(), token);
  }
}
