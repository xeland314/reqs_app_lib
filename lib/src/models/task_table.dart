import 'package:reqs_app_backend/src/mixins/descriptible.dart';
import 'package:reqs_app_backend/src/mixins/indexable.dart';
import 'package:reqs_app_backend/src/models/module.dart';
import 'package:reqs_app_backend/src/models/risk.dart';
import 'package:reqs_app_backend/src/models/task.dart';

/// Represents a table of tasks with additional risks.
class TaskTable with Indexable, Descriptible {
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
