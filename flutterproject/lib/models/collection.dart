class Collection {
  final int? id;
  final String status;
  final int carId;
  final int userId;

  Collection({
    this.id,
    required this.status,
    required this.carId,
    required this.userId,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      status: json['status'],
      carId: json['carId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'carId': carId,
      'userId': userId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Collection otherCollection = other as Collection;
    return id == otherCollection.id &&
        status == otherCollection.status &&
        carId == otherCollection.carId &&
        userId == otherCollection.userId;
  }

  @override
  int get hashCode =>
      id.hashCode ^ status.hashCode ^ carId.hashCode ^ userId.hashCode;

  @override
  String toString() {
    return 'Collection{id: $id, status: $status, carId: $carId, userId: $userId}';
  }
}
