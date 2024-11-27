import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:reqs_app_backend/src/models/task_table.dart';
import 'package:csv/csv.dart';

class CsvExportService {
  /// Exports the TaskTable to a CSV string.
  static String exportToCsv(TaskTable taskTable) {
    List<List<dynamic>> rows = [
      [
        'Order',
        'ID',
        'Name',
        'Description',
        'Optimistic Time',
        'Probable Time',
        'Pessimistic Time',
        'TPE',
        'Considerations',
      ]
    ];

    for (var task in taskTable.tasks) {
      rows.add([
        task.order,
        task.id,
        task.name,
        task.description,
        task.optimisticTime.toString(),
        task.probableTime.toString(),
        task.pessimisticTime.toString(),
        task.calculatePartialEstimatedTime().toString(),
        task.considerations.map((c) => c.toString()).join('; '),
      ]);
    }

    for (var module in taskTable.modules) {
      for (var task in module.tasks) {
        rows.add([
          task.order,
          task.id,
          task.name,
          task.description,
          task.optimisticTime.toString(),
          task.probableTime.toString(),
          task.pessimisticTime.toString(),
          task.calculatePartialEstimatedTime().toString(),
          task.considerations.map((c) => c.toString()).join('; '),
        ]);
      }
    }

    return const ListToCsvConverter().convert(rows);
  }
}
