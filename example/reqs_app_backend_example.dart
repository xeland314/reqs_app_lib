import 'package:reqs_app_backend/reqs_app_backend.dart';

void main() {
  var table = TaskTable(name: "Proyecto");
  table.addTask(
    Task(
      name: "Crear librería",
      description: "Inicializar proyecto en dart",
      optimisticTime: Time(value: 0.25, unit: TimeUnit.hours),
      probableTime: Time(value: 0.5, unit: TimeUnit.hours),
      pessimisticTime: Time(value: 1, unit: TimeUnit.hours),
      considerations: [],
    ),
  );
  table.addTask(
    Task(
      name: "Crear repositorio",
      description: "Crear repo para la librería",
      optimisticTime: Time(value: 0.25, unit: TimeUnit.hours),
      probableTime: Time(value: 0.5, unit: TimeUnit.hours),
      pessimisticTime: Time(value: 1, unit: TimeUnit.hours),
      considerations: [],
    ),
  );
  print(table.calculateFinalTotalTime());
  print(JsonExportService.exportToJson(table));
  print(CsvExportService.exportToCsv(table));
  //ExcelExportService.exportToExcel(table, "/home/xeland314/workspace/table.xslx");
}
