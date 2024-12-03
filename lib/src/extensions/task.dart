import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';
import 'package:reqs_app_backend/src/models/task.dart';
import 'package:reqs_app_backend/src/models/time.dart';

/// Extension methods for calculating partial estimated time for a Task.
extension TaskTimeCalculations on Task {
  /// Calculates the partial estimated time (TPE) for the task.
  /// TPE is calculated using the formula: TPE = (o + 4 * m + p) / 6
  /// where:
  /// - o is the optimistic time
  /// - m is the probable time
  /// - p is the pessimistic time
  Time calculatePartialEstimatedTime() {
    Decimal totalMinutes = optimisticTime.toMinutes() +
        Decimal.fromInt(4) * probableTime.toMinutes() +
        pessimisticTime.toMinutes();
    Rational result = totalMinutes / Decimal.fromInt(6);
    return Time(value: result.toDouble(), unit: TimeUnit.minutes);
  }
}
