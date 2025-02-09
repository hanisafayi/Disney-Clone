// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutterproject/data.dart';
// import 'package:meta/meta.dart';
// import '../../../data/data_providers/collections_data_provider.dart';
// import '../../../data/repositories/collections_repository.dart';
// import '../../../data/repositories/cars_repository.dart';
// import '../../../models/collection.dart';
// import '../../../models/car.dart';

// part 'cars_event.dart';
// part 'cars_state.dart';

// class CarsBloc extends Bloc<CarsEvent, CarsState> {
//   final CarsRepository _carsRepository;

//   CarsBloc(this._carsRepository) : super(CarsInitial()) {
//     on<CarsLoadEvent>(_onCarsLoadEvent);
//     on<CreateCarEvent>(_onCarCreationEvent);
//     on<UpdateCarEvent>(_onCarUpdateEvent);
//     on<DeleteCarEvent>(_onCarDeleteEvent);
//     on<AddCarToCollection>(_onAddCarToCollection);
//     on<RemoveACarFromCollection>(_onRemoveACarFromCollection);
//   }

//   void _onCarsLoadEvent(CarsLoadEvent event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());

//     if (event.flag == 1) {
//       emit(CarsLoaded(const [], const []));
//     }

//     try {
//       if (event.userId == null) {
//         throw Exception("Please log in first.");
//       }
//       final CollectionsDataProvider collectionsDataProvider =
//           CollectionsDataProvider();
//       final CollectionsRepository collectionsRepository =
//           CollectionsRepository(collectionsDataProvider);
//       final List<Collection> collections =
//           await collectionsRepository.getCollections();
//       final List<Collection> usersCollection = collections
//           .where((collection) => collection.userId == event.userId)
//           .toList();
//       final List<int> userFavoriteCarIds = <int>[];
//       for (final collection in usersCollection) {
//         userFavoriteCarIds.add(collection.carId);
//       }

//       final cars = await _carsRepository.getCars();

//       emit(CarsLoaded(cars, userFavoriteCarIds));
//       return;
//     } catch (e) {
//       emit(CarLoadError(e.toString()));
//       return;
//     }
//   }

//   void _onCarCreationEvent(
//       CreateCarEvent event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());
//     try {
//       final String brand = event.brand;
//       final String condition = event.condition;
//       final String model = event.model;
//       final String id = event.id;
//       final String price = event.price;
//       final String images = event.images;
//       final String token = event.token;

//       if (brand.isEmpty ||
//           condition.isEmpty ||
//           model.isEmpty ||
//           id.isEmpty ||
//           price.isEmpty ||
//           images.isEmpty) {
//         emit(CarProcessingError("All fields are required"));
//         return;
//       }

//       final Car car = Car(
//         brand: brand,
//         condition: condition,
//         model: model,
//         id: id,
//         price: price,
//         images: images,
//       );

//       await _carsRepository.createCar(car, token);
//       emit(CarCreationSuccess(car));
//       return;
//     } catch (e) {
//       emit(CarProcessingError("Car creation failed."));
//       return;
//     }
//   }

//   void _onCarUpdateEvent(UpdateCarEvent event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());
//     try {
//       final String brand = event.brand;
//       final String condition = event.condition;
//       final String model = event.model;
//       final String id = event.id;
//       final String price = event.price;
//       final String images = event.images;
//       final String token = event.token;

//       if (brand.isEmpty ||
//           condition.isEmpty ||
//           model.isEmpty ||
//           id.isEmpty ||
//           price.isEmpty ||
//           images.isEmpty) {
//         emit(CarProcessingError("All fields are required"));
//         return;
//       }

//       final Car car = Car(
//         id: event.id,
//         brand: brand,
//         condition: condition,
//         model: model,
//         id: id,
//         price: price,
//         images: images,
//       );

//       await _carsRepository.updateCar(car, token);
//       emit(CarUpdateSuccess(car));
//       return;
//     } catch (e) {
//       emit(CarProcessingError("Car update failed."));
//       return;
//     }
//   }

//   void _onCarDeleteEvent(DeleteCarEvent event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());
//     try {
//       if (event.car.id == null) {
//         emit(CarProcessingError("Car ID is required"));
//         return;
//       }
//       await _carsRepository.deleteCar(event.car.id!, event.token);
//       emit(CarDeleteSuccess(event.car));
//       return;
//     } catch (e) {
//       emit(CarProcessingError("Car deletion failed."));
//       return;
//     }
//   }

//   void _onAddCarToCollection(
//       AddCarToCollection event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());
//     if (event.flag == 1) {
//       emit(CarToCollectionAddSuccess(""));
//     }
//     try {
//       final CollectionsDataProvider collectionsDataProvider =
//           CollectionsDataProvider();
//       final CollectionsRepository collectionsRepository =
//           CollectionsRepository(collectionsDataProvider);
//       await collectionsRepository.addCollection(
//         Collection(
//           status: "UNPINNED",
//           carId: event.car.id!,
//           userId: event.userId,
//         ),
//       );
//       emit(CarToCollectionAddSuccess(event.car.brand));
//       return;
//     } catch (e) {
//       emit(CarLoadError(e.toString()));
//     }
//   }

//   void _onRemoveACarFromCollection(
//       RemoveACarFromCollection event, Emitter<CarsState> emit) async {
//     emit(CarsLoading());
//     if (event.flag == 1) {
//       emit(CarFromCollectionRemoveSuccess(""));
//     }
//     try {
//       final CollectionsDataProvider collectionsDataProvider =
//           CollectionsDataProvider();
//       final CollectionsRepository collectionsRepository =
//           CollectionsRepository(collectionsDataProvider);
//       final List<Collection> collections =
//           await collectionsRepository.getCollections();
//       final col = collections
//           .where((collection) =>
//               collection.userId == event.userId &&
//               collection.carId == event.car.id)
//           .toList();
//       if (col.isEmpty) {
//         emit(CarLoadError("Collection not found"));
//         return;
//       }
//       final collectionId = col[0].id;

//       await collectionsRepository.deleteCollection(collectionId!);
//       emit(CarFromCollectionRemoveSuccess(event.car.brand));
//       return;
//     } catch (e) {
//       emit(CarLoadError(e.toString()));
//     }
//   }
// }
