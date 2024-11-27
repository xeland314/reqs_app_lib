import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:reqs_app_backend/src/models/consideration.dart';
import 'package:reqs_app_backend/src/models/time.dart';
import 'package:uuid/uuid.dart';

/// Represents a task with optimistic, probable, and pessimistic time estimates.
class Task {
  String id;
  String name;
  String description;
  Time optimisticTime;
  Time probableTime;
  Time pessimisticTime;
  List<Consideration> considerations;
  int _order;

  Task({
    required this.name,
    required this.description,
    required this.optimisticTime,
    required this.probableTime,
    required this.pessimisticTime,
    required this.considerations,
  })  : id = Uuid().v4(), // Generate a unique UUID for each task
        _order = 0; // Default order value

  /// Sets the order of the task.
  void setOrder(int order) {
    _order = order;
  }

  /// Gets the order of the task.
  int get order => _order;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  /// Converts the task to a JSON map.
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
      'order': _order,
    };
  }

  /// Converts the task to a map for SQLite.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order': _order,
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
    return 'Task{id: $id, name: $name, description: $description, optimisticTime: $optimisticTime, probableTime: $probableTime, pessimisticTime: $pessimisticTime, considerations: $considerations, order: $_order}';
  }
}
