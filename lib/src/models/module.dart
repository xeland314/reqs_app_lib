import 'package:reqs_app_backend/src/models/task.dart';
import 'package:uuid/uuid.dart';

class Module {
  String id;
  String title;
  String description;
  List<Task> tasks = [];
  int _order;

  Module({required this.title, required this.description})
      : id = Uuid().v4(),
        _order = 0; // Generate a unique UUID for each module

  /// Sets the order of the module.
  void setOrder(int order) {
    _order = order;
  }

  /// Gets the order of the module.
  int get order => _order;
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

  /// Converts the task to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tasks': tasks.map((t) => t.toJson()).toList(),
      'order': _order,
    };
  }

  @override
  String toString() {
    return 'Module{id: $id, title: $title, description: $description, tasks: $tasks, order: $_order}';
  }
}
