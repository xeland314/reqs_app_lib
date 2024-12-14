import 'package:reqs_app_backend/src/models/extra_task.dart';
import 'package:reqs_app_backend/reqs_app_backend.dart';

/// Represents a risk with an extra time.
class Risk extends ExtraTask {
  Risk({
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

    return other is Risk && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Risk{id: $id, name: $name, description: $description, time: $extraTime, order: $order}';
  }

  /// Converts the risk to a map for SQLite.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'extraTime': extraTime.toString(),
      'order': order,
    };
  }

  /// Creates a risk from a map.
  static Risk fromMap(Map<String, dynamic> map) {
    return Risk(
      name: map['name'],
      description: map['description'],
      extraTime: Time.fromString(map['extraTime']),
    )
      ..setOrder(map['order'])
      ..setID(map["id"]);
  }
}
