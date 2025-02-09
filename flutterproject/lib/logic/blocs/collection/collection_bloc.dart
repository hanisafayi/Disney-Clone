import 'package:bloc/bloc.dart';
import 'package:flutterproject/data/data_providers/cars_data_provider.dart';
import 'package:flutterproject/data/repositories/cars_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/data_providers/collections_data_provider.dart';
import '../../../data/data_providers/users_data_provider.dart';
import '../../../data/repositories/collections_repository.dart';
import '../../../data/repositories/cars_repository.dart';
import '../../../data/repositories/users_repository.dart';
import '../../../models/collection.dart';
import '../../../models/car.dart';
import '../../../models/user.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionsRepository _collectionsRepository;

  CollectionBloc(this._collectionsRepository) : super(CollectionInitial()) {
    on<FetchCollection>(_onFetchCollection);
  }

  Future<void> _onFetchCollection(
      FetchCollection event, Emitter<CollectionState> emit) async {
    emit(CollectionLoading());
    try {
      final UsersDataProvider usersDataProvider = UsersDataProvider();
      final UsersRepository usersRepository =
          UsersRepository(usersDataProvider);
      final User loggedInUser =
          await usersRepository.getCurrentUser(event.token);

      final userId = loggedInUser.id ?? 0;
      final List<int> unpinnedCarIds =
          await _collectionsRepository.getCarIdsByStatus(userId, "UNPINNED");
      final List<int> pinnedCarIds =
          await _collectionsRepository.getCarIdsByStatus(userId, "PINNED");

      final List<int> carsInUsersCollection = [
        ...unpinnedCarIds,
        ...pinnedCarIds
      ];

      if (carsInUsersCollection.isEmpty) {
        emit(CollectionEmpty());
        return;
      }

      final CarsDataProvider carsDataProvider = CarsDataProvider();
      final CarsRepository carsRepository = CarsRepository(carsDataProvider);
      final List<Car> cars = await carsRepository.getCars();
      cars.retainWhere((car) => carsInUsersCollection.contains(car.id));

      final pinnedCars = <Car>[];
      final unPinnedCars = <Car>[];

      for (var car in cars) {
        if (pinnedCarIds.contains(car.id)) {
          pinnedCars.add(car);
        } else {
          unPinnedCars.add(car);
        }
      }

      emit(CollectionLoaded([...pinnedCars], [...unPinnedCars]));
      return;
    } catch (e) {
      emit(CollectionError(e.toString()));
    }
  }
}
