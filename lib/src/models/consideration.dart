import 'package:reqs_app_backend/src/models/time.dart';
import 'package:uuid/uuid.dart';

/// Represents a consideration with an extra time.
class Consideration {
  String id;
  String name;
  String description;
  Time extraTime;
  int _order;

  Consideration({
    required this.name,
    required this.description,
    required this.extraTime,
  })  : id = Uuid().v4(),
        _order = 0;

  /// Sets the order of the consideration.
  void setOrder(int order) {
    _order = order;
  }

  /// Gets the order of the consideration.
  int get order => _order;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Consideration && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  /// Converts the consideration to a JSON map.
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
    return 'Consideration{id: $id, name: $name, description: $description, order: $_order}';
  }
}
