import 'package:decimal/decimal.dart';
import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:test/test.dart';
import 'package:reqs_app_backend/src/models/task.dart';
import 'package:reqs_app_backend/src/models/time.dart';

void main() {
  group('Task', () {
    test('Task generates a unique UUID', () {
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
      expect(task1.id, isNot(task2.id));
    });

    test('calculatePartialEstimatedTime returns correct TPE', () {
      final task = Task(
        name: 'Task',
        description: 'Description',
        optimisticTime: Time(value: 1, unit: TimeUnit.hours),
        probableTime: Time(value: 2, unit: TimeUnit.hours),
        pessimisticTime: Time(value: 3, unit: TimeUnit.hours),
        considerations: [],
      );
      final tpe = task.calculatePartialEstimatedTime();
      expect(
        tpe.value.toDouble(),
        closeTo(Decimal.parse('120.00').toDouble(), 0.001),
      );
      expect(tpe.unit, TimeUnit.minutes);
    });
  });
}
