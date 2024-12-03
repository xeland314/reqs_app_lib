import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:reqs_app_backend/src/mixins/descriptible.dart';
import 'package:reqs_app_backend/src/mixins/indexable.dart';
import 'package:reqs_app_backend/src/interfaces/jsonable.dart';
import 'package:reqs_app_backend/src/mixins/orderable.dart';
import 'package:reqs_app_backend/src/mixins/timestampable.dart';
import 'package:reqs_app_backend/src/models/consideration.dart';
import 'package:reqs_app_backend/src/models/time.dart';

/// Represents a task with optimistic, probable, and pessimistic time estimates.
class Task
    with Indexable, Descriptible, Orderable, Timestampable
    implements Jsonable {
  Time optimisticTime;
  Time probableTime;
  Time pessimisticTime;
  List<Consideration> considerations;

  Task({
    required name,
    required description,
    required this.optimisticTime,
    required this.probableTime,
    required this.pessimisticTime,
    required this.considerations,
  }) {
    setName(name);
    setDescription(description);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  /// Converts the task to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'optimisticTime': optimisticTime.toString(),
      'probableTime': probableTime.toString(),
      'pessimisticTime': pessimisticTime.toString(),
      'tpe': calculatePartialEstimatedTime().toString(),
      'considerations': considerations.map((c) => c.toJson()).toList(),
      'order': order,
    };
  }

  /// Converts the task to a map for SQLite.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order': order,
      'name': name,
      'description': description,
      'optimisticTime': optimisticTime.toString(),
      'probableTime': probableTime.toString(),
      'pessimisticTime': pessimisticTime.toString(),
      'tpe': calculatePartialEstimatedTime().toString(),
      'considerations': considerations.map((c) => c.toJson()).join('; '),
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, description: $description, optimisticTime: $optimisticTime, probableTime: $probableTime, pessimisticTime: $pessimisticTime, considerations: $considerations, order: $order}';
  }
}
