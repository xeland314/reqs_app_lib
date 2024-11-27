import 'package:decimal/decimal.dart';
import 'package:reqs_app_backend/reqs_app_backend.dart';
import 'package:test/test.dart';

void main() {
  group('TaskTable', () {
    test('calculateTotalPartialEstimatedTime returns correct total TPE', () {
      final task1 = Task(
        name: 'Task 1',
        description: 'Description 1',
        optimisticTime: Time(value: 1, unit: TimeUnit.hours),
        probableTime: Time(value: 2, unit: TimeUnit.hours),
        pessimisticTime: Time(value: 3, unit: TimeUnit.hours),
        considerations: [],
      );
      final task2 = Task(
        name: 'Task 2',
        description: 'Description 2',
        optimisticTime: Time(value: 1, unit: TimeUnit.hours),
        probableTime: Time(value: 2, unit: TimeUnit.hours),
        pessimisticTime: Time(value: 3, unit: TimeUnit.hours),
        considerations: [],
      );
      final taskTable = TaskTable(name: "Tabla 1");
      taskTable.addTask(task1);
      taskTable.addTask(task2);

      final totalTPE = taskTable.calculateTotalPartialEstimatedTime();
      expect(totalTPE.value.toDouble(),
          closeTo(Decimal.parse('240.00').toDouble(), 0.001));
      expect(totalTPE.unit, TimeUnit.minutes);
    });

    test('calculateFinalTotalTime returns correct final total time', () {
      final task1 = Task(
        name: 'Task 1',
        description: 'Description 1',
        optimisticTime: Time(value: 1, unit: TimeUnit.hours),
        probableTime: Time(value: 2, unit: TimeUnit.hours),
        pessimisticTime: Time(value: 3, unit: TimeUnit.hours),
        considerations: [
          Consideration(
            name: 'Consideration 1',
            description: 'Desc',
            extraTime: Time(value: 30, unit: TimeUnit.minutes),
          )
        ],
      );
      final task2 = Task(
        name: 'Task 2',
        description: 'Description 2',
        optimisticTime: Time(value: 1, unit: TimeUnit.hours),
        probableTime: Time(value: 2, unit: TimeUnit.hours),
        pessimisticTime: Time(value: 3, unit: TimeUnit.hours),
        considerations: [],
      );
      final risk = Risk(
          name: 'Risk 1',
          description: 'Desc',
          extraTime: Time(value: 1, unit: TimeUnit.hours));

      final taskTable = TaskTable(name: "Tabla 2");
      taskTable.addTask(task1);
      taskTable.addTask(task2);
      taskTable.addRisk(risk);

      final finalTotalTime = taskTable.calculateFinalTotalTime();
      expect(finalTotalTime.value.toDouble(),
          closeTo(Decimal.parse('330.00').toDouble(), 0.001));
      expect(finalTotalTime.unit, TimeUnit.minutes);
    });
  });
}
