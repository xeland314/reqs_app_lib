import 'package:reqs_app_backend/src/extensions/task.dart';
import 'package:reqs_app_backend/src/models/task_table.dart';
import 'package:reqs_app_backend/src/models/time.dart';

/// Extension methods for calculating total partial and final times in a TaskTable.
extension TaskTableTimeCalculations on TaskTable {
  /// Calculates the total partial estimated time for all tasks and tasks within modules.
  Time calculateTotalPartialEstimatedTime() {
    Time total = Time(value: 0, unit: TimeUnit.minutes);
    for (var task in tasks) {
      total += task.calculatePartialEstimatedTime();
    }
    for (var module in modules) {
      for (var task in module.tasks) {
        total += task.calculatePartialEstimatedTime();
      }
    }
    return total;
  }

  /// Calculates the final total time including tasks, risks, and considerations.
  Time calculateFinalTotalTime() {
    Time total = calculateTotalPartialEstimatedTime();
    for (var task in tasks) {
      for (var consideration in task.considerations) {
        total += consideration.extraTime;
      }
    }
    for (var module in modules) {
      for (var task in module.tasks) {
        for (var consideration in task.considerations) {
          total += consideration.extraTime;
        }
      }
    }
    for (var risk in risks) {
      total += risk.extraTime;
    }
    return total;
  }
}
