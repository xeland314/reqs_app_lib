import 'package:reqs_app_backend/src/models/time.dart';
import 'package:uuid/uuid.dart';

/// Represents a risk with an extra time.
class Risk {
  String id;
  String name;
  String description;
  Time extraTime;
  int _order;

  Risk({
    required this.name,
    required this.description,
    required this.extraTime,
  })  : id = Uuid().v4(),
        _order = 0;

  /// Sets the order of the risk.
  void setOrder(int order) {
    _order = order;
  }

  /// Gets the order of the risk.
  int get order => _order;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Risk && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  /// Converts the task to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'extraTime': extraTime,
      'order': _order,
    };
  }

  @override
  String toString() {
    return 'Risk{id: $id, name: $name, description: $description, time: $extraTime, order: $_order}';
  }
}
