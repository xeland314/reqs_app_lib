import 'package:reqs_app_backend/src/mixins/descriptible.dart';
import 'package:reqs_app_backend/src/mixins/indexable.dart';
import 'package:reqs_app_backend/src/mixins/timestampable.dart';
import 'package:reqs_app_backend/src/models/module.dart';
import 'package:reqs_app_backend/src/models/risk.dart';
import 'package:reqs_app_backend/src/models/task.dart';

/// Represents a table of tasks with additional risks.
class TaskTable with Indexable, Descriptible, Timestampable {
  List<Task> tasks = [];
  List<Risk> risks = [];
  List<Module> modules = [];

  TaskTable({required name, description = ""}) {
    setName(name);
    setDescription(description);
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  void addRisk(Risk risk) {
    risks.add(risk);
  }

  void addModule(Module module) {
    modules.add(module);
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      // Convert lists to JSON strings or other suitable formats
      'tasks': tasks.map((task) => task.toMap()).toList(),
      'risks': risks.map((risk) => risk.toMap()).toList(),
      'modules': modules.map((module) => module.toMap()).toList(),
    };
  }

  factory TaskTable.fromMap(Map<String, dynamic> map) {
    return TaskTable(
      name: map['name'],
      description: map['description'],
    )
      ..setID(map["id"])
      ..tasks = List<Task>.from(map['tasks'].map((task) => Task.fromMap(task)))
      ..risks = List<Risk>.from(map['risks'].map((risk) => Risk.fromMap(risk)))
      ..modules = List<Module>.from(
          map['modules'].map((module) => Module.fromMap(module)));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskTable && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'TaskTable{id: $id, name: $name, tasks: $tasks, modules: $modules, risks: $risks}';
  }
}
