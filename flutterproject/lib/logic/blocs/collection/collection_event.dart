part of 'collection_bloc.dart';

@immutable
sealed class CollectionEvent {}

class FetchCollection extends CollectionEvent {
  final String token;

  FetchCollection(this.token);
}

class PinCarInCollection extends CollectionEvent {
  final Car car;
  final int userId;

  PinCarInCollection(this.car, this.userId);
}

class UnpinCarInCollection extends CollectionEvent {
  final Car car;
  final int userId;

  UnpinCarInCollection(this.car, this.userId);
}

class ClearCollection extends CollectionEvent {}
