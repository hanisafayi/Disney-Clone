import 'dart:convert';

import '../../models/collection.dart';
import '../data_providers/collections_data_provider.dart';

class CollectionsRepository {
  final CollectionsDataProvider _collectionsDataProvider;
  CollectionsRepository(this._collectionsDataProvider);

  Future<List<Collection>> getCollections() async {
    final response = await _collectionsDataProvider.getCollections();
    final collections = jsonDecode(response);
    final allCollections = <Collection>[];
    for (final collection in collections) {
      allCollections.add(Collection.fromJson(collection));
    }
    return allCollections;
  }

  Future<Collection> getCollection(int collectionId) async {
    final response =
        await _collectionsDataProvider.getCollection(collectionId.toString());
    final collection = jsonDecode(response);
    return Collection.fromJson(collection);
  }

  Future<List<int>> getCarIdsByStatus(int userId, String status) async {
    final response = await _collectionsDataProvider.getCarIdsByStatus(
        userId.toString(), status);
    final carIds = jsonDecode(response);
    final allCarIds = <int>[];
    for (final carId in carIds) {
      allCarIds.add(carId);
    }
    return allCarIds;
  }

  Future<Collection> addCollection(Collection collection) async {
    final response = await _collectionsDataProvider.addCollection({
      'userId': collection.userId,
      'status': collection.status,
      'carId': collection.carId,
    });
    final newCollection = jsonDecode(response);
    return Collection.fromJson(newCollection);
  }

  Future<void> deleteCollection(int collectionId) async {
    await _collectionsDataProvider.deleteCollection(collectionId.toString());
  }

  Future<Collection> updateCollection(
      int collectionId, Collection collection) async {
    final response = await _collectionsDataProvider
        .updateCollection(collectionId.toString(), {
      'userId': collection.userId,
      'status': collection.status,
      'carId': collection.carId,
    });
    final updatedCollection = jsonDecode(response);
    return Collection.fromJson(updatedCollection);
  }
}
