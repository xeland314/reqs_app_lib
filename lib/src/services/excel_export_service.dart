import 'package:excel/excel.dart';
import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:reqs_app_backend/src/models/task_table.dart';
import 'dart:io';

class ExcelExportService {
  /// Exports the TaskTable to an Excel file.
  static void exportToExcel(TaskTable taskTable, String filePath) {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    sheetObject.appendRow([
      TextCellValue('Order'),
      TextCellValue('ID'),
      TextCellValue('Name'),
      TextCellValue('Description'),
      TextCellValue('Optimistic Time'),
      TextCellValue('Probable Time'),
      TextCellValue('Pessimistic Time'),
      TextCellValue('TPE'),
      TextCellValue('Considerations'),
    ]);

    for (var task in taskTable.tasks) {
      sheetObject.appendRow([
        IntCellValue(task.order),
        TextCellValue(task.id),
        TextCellValue(task.name),
        TextCellValue(task.description),
        TextCellValue(task.optimisticTime.toString()),
        TextCellValue(task.probableTime.toString()),
        TextCellValue(task.pessimisticTime.toString()),
        TextCellValue(task.calculatePartialEstimatedTime().toString()),
        TextCellValue(task.considerations.map((c) => c.toString()).join('; ')),
      ]);
    }

    for (var module in taskTable.modules) {
      for (var task in module.tasks) {
        sheetObject.appendRow([
          IntCellValue(task.order),
          TextCellValue(task.id),
          TextCellValue(task.name),
          TextCellValue(task.description),
          TextCellValue(task.optimisticTime.toString()),
          TextCellValue(task.probableTime.toString()),
          TextCellValue(task.pessimisticTime.toString()),
          TextCellValue(task.calculatePartialEstimatedTime().toString()),
          TextCellValue(
              task.considerations.map((c) => c.toString()).join('; ')),
        ]);
      }
    }

    var fileBytes = excel.encode();
    if (fileBytes != null) {
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }
  }
}
