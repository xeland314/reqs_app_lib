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
}
