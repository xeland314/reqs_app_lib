import 'dart:convert';
import 'package:reqs_app_backend/src/models/task_table.dart';

class JsonExportService {
  /// Exports the TaskTable to a JSON string.
  static String exportToJson(TaskTable taskTable) {
    final Map<String, dynamic> data = {
      'id': taskTable.id,
      'name': taskTable.name,
      'tasks': taskTable.tasks.map((task) => task.toJson()).toList(),
      'modules': taskTable.modules.map((module) => module.toJson()).toList(),
      'risks': taskTable.risks.map((risk) => risk.toJson()).toList(),
    };
    return jsonEncode(data);
  }
}
