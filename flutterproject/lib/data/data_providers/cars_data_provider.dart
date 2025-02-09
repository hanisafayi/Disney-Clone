import 'dart:convert';
import 'dart:io';

import '../../core/constants.dart';
import 'package:http/http.dart' as http;

class CarsDataProvider {
  final String _baseUrl = apiBaseUrl;

  Future<String> getCollections({int flag = 0}) async {
    if (flag == 1) {
      throw Exception('Not implemented');
    } else if (flag == 2) {
      return jsonEncode([
        {"id": "1", "name": "Collection 1"},
        {"id": "2", "name": "Collection 2"}
      ]);
    }
    try {
      final response = await http.get(Uri.parse("$_baseUrl/collections"));
      if (response.statusCode == 200) {
        return response.body;
      }
      throw Exception('Failed to load collections');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getCollection(String collectionId, {int flag = 0}) async {
    if (flag == 1) {
      return jsonEncode({"id": "1", "name": "Collection 1"});
    } else if (flag == 2) {
      throw Exception('Not implemented');
    }
    try {
      final response =
          await http.get(Uri.parse("$_baseUrl/collections/$collectionId"));
      if (response.statusCode == 200) {
        return response.body;
      }
      throw Exception('Failed to load collection');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<int>> getUserIdsByStatus(String userId, String status,
      {int flag = 0}) async {
    if (flag == 1) {
      return [1, 2];
    } else if (flag == 2) {
      throw Exception('Not implemented');
    }
    try {
      if (!(status.toLowerCase().trim() == "pinned" ||
          status.toLowerCase().trim() == "unpinned")) {
        throw Exception("Invalid car status");
      }
      final response = await http.get(Uri.parse(
          "$_baseUrl/collections/user/$userId?status=${status.toString().toUpperCase()}"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body).cast<int>();
      }
      throw Exception('Failed to load cars in collection');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> addCollection(Map<String, dynamic> collection,
      {int flag = 0}) async {
    if (flag == 1) {
      return jsonEncode({"id": "3", "name": "New Collection"});
    } else if (flag == 2) {
      throw Exception('Not implemented');
    }
    try {
      final response = await http.post(Uri.parse("$_baseUrl/collections/new"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(collection));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      throw Exception('Failed to create collection item');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> deleteCollection(String collectionId, {int flag = 0}) async {
    if (flag == 1) {
      return true;
    } else if (flag == 2) {
      throw Exception('Not implemented');
    }
    try {
      final response =
          await http.delete(Uri.parse("$_baseUrl/collections/$collectionId"));
      if (response.statusCode == 200) {
        return true;
      }
      throw Exception('Failed to delete collection');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> updateCollection(
      String collectionId, Map<String, dynamic> collection,
      {int flag = 0}) async {
    if (flag == 1) {
      return jsonEncode({"id": "1", "name": "Updated Collection"});
    } else if (flag == 2) {
      throw Exception('Not implemented');
    } else if (flag == 3) {
      throw const SocketException('Not implemented');
    }
    try {
      final response = await http.patch(
          Uri.parse("$_baseUrl/collections/$collectionId"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(collection));
      if (response.statusCode == 200) {
        return response.body;
      }
      throw Exception('Failed to update collection item');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void dispose() {
    // Close any resources if needed.
  }

  getCars() {}

  getCarById(String string) {}

  addCar(Map<String, String> map, String token) {}

  updateCar(Map<String, Object?> map, String token) {}

  deleteCar(String string, String token) {}

  getCarIdsByStatus(String string, String status) {}
}