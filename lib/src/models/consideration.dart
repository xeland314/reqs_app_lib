import 'package:reqs_app_backend/src/models/extra_task.dart';
import 'package:reqs_app_backend/src/models/time.dart';

/// Represents a consideration with an extra time.
class Consideration extends ExtraTask {
  Consideration({
    required String name,
    required String description,
    required Time extraTime,
  }) {
    setName(name);
    setDescription(description);
    setExtraTime(extraTime);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Consideration && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Consideration{id: $id, name: $name, description: $description, order: $order}';
  }

  /// Converts the consideration to a map for SQLite.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'extraTime': extraTime.toString(),
      'order': order,
    };
  }

  /// Creates a consideration from a map.
  static Consideration fromMap(Map<String, dynamic> map) {
    return Consideration(
      name: map['name'],
      description: map['description'],
      extraTime: Time.fromString(map['extraTime']),
    )
      ..setOrder(map['order'])
      ..setID(map["id"]);
  }

  /// Creates a consideration from a JSON object.
  static Consideration fromJson(Map<String, dynamic> json) {
    return Consideration(
      name: json['name'],
      description: json['description'],
      extraTime: Time.fromString(json['extraTime']),
    )
      ..setOrder(json['order'])
      ..setID(json["id"]);
  }
}
