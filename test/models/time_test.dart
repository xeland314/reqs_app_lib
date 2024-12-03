import 'package:decimal/decimal.dart';
import 'package:test/test.dart';
import 'package:reqs_app_backend/src/models/time.dart';

void main() {
  group('Time', () {
    test('toMinutes converts hours to minutes', () {
      final time = Time(value: 2, unit: TimeUnit.hours);
      expect(time.toMinutes(), Decimal.fromInt(120));
    });

    test('toMinutes converts days to minutes', () {
      final time = Time(value: 1, unit: TimeUnit.days);
      expect(time.toMinutes(), Decimal.fromInt(1440));
    });

    test('operator + adds two Time objects', () {
      final time1 = Time(value: 1, unit: TimeUnit.hours);
      final time2 = Time(value: 30, unit: TimeUnit.minutes);
      final result = time1 + time2;
      expect(result.value, Decimal.fromInt(90));
      expect(result.unit, TimeUnit.minutes);
    });

    test('toString returns correct string representation', () {
      final time = Time(value: 2, unit: TimeUnit.hours);
      expect(time.toString(), '2.00 hours');
    });
  });
}
