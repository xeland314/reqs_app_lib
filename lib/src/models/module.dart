import 'package:reqs_app_backend/src/mixins/descriptible.dart';
import 'package:reqs_app_backend/src/mixins/indexable.dart';
import 'package:reqs_app_backend/src/interfaces/jsonable.dart';
import 'package:reqs_app_backend/src/mixins/orderable.dart';
import 'package:reqs_app_backend/src/mixins/timestampable.dart';
import 'package:reqs_app_backend/src/models/task.dart';

class Module
    with Indexable, Descriptible, Orderable, Timestampable
    implements Jsonable {
  List<Task> tasks = [];

  Module({required name, required description}) {
    setName(name);
    setDescription(description);
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Module && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  /// Converts the module to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tasks': tasks.map((t) => t.toJson()).toList(),
      'order': order,
    };
  }

  @override
  String toString() {
    return 'Module{id: $id, name: $name, description: $description, tasks: $tasks, order: $order}';
  }

  /// Converts the module to a map for database storage.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tasks': tasks.map((task) => task.toMap()).toList(),
      'order': order,
    };
  }

  /// Creates a module from a map.
  static Module fromMap(Map<String, dynamic> map) {
    return Module(
      name: map['name'],
      description: map['description'],
    )
      ..tasks = List<Task>.from(map['tasks'].map((task) => Task.fromMap(task)))
      ..setOrder(map['order'])
      ..setID(map["id"]);
  }
}
