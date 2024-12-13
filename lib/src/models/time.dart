import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

enum TimeUnit {
  minutes,
  hours,
  days,
  weeks,
}

/// Represents a time duration with a value and a unit.
class Time implements Comparable<Time> {
  Decimal value;
  TimeUnit unit;

  Time({
    required double value,
    required this.unit,
  }) : value = Decimal.parse(value.toStringAsFixed(2)) {
    if (this.value < Decimal.zero) {
      throw ArgumentError('Time value cannot be negative');
    }
  }

  /// Converts the time to minutes.
  Decimal toMinutes() {
    switch (unit) {
      case TimeUnit.hours:
        return value * Decimal.fromInt(60);
      case TimeUnit.days:
        return value * Decimal.fromInt(60) * Decimal.fromInt(24);
      case TimeUnit.weeks:
        return value *
            Decimal.fromInt(60) *
            Decimal.fromInt(24) *
            Decimal.fromInt(7);
      default:
        return value; // assuming the default unit is minutes
    }
  }

  /// Converts the time to hours.
  Decimal toHours() {
    switch (unit) {
      case TimeUnit.minutes:
        Rational result = value / Decimal.fromInt(60);
        return result.toDecimal();
      case TimeUnit.days:
        return value * Decimal.fromInt(24);
      case TimeUnit.weeks:
        return value * Decimal.fromInt(24) * Decimal.fromInt(7);
      default:
        return value; // assuming the default unit is hours
    }
  }

  /// Converts the time to days.
  Decimal toDays() {
    switch (unit) {
      case TimeUnit.minutes:
        Rational result = value / (Decimal.fromInt(60) * Decimal.fromInt(24));
        return result.toDecimal();
      case TimeUnit.hours:
        Rational result = value / Decimal.fromInt(24);
        return result.toDecimal();
      case TimeUnit.weeks:
        return value * Decimal.fromInt(7);
      default:
        return value; // assuming the default unit is days
    }
  }

  /// Converts the time to weeks.
  Decimal toWeeks() {
    switch (unit) {
      case TimeUnit.minutes:
        Rational result = value /
            (Decimal.fromInt(60) * Decimal.fromInt(24) * Decimal.fromInt(7));
        return result.toDecimal();
      case TimeUnit.hours:
        Rational result = value / (Decimal.fromInt(24) * Decimal.fromInt(7));
        return result.toDecimal();
      case TimeUnit.days:
        Rational result = value / Decimal.fromInt(7);
        return result.toDecimal();
      default:
        return value; // assuming the default unit is weeks
    }
  }

  /// Adds two Time objects.
  Time operator +(Time other) {
    Decimal totalMinutes = toMinutes() + other.toMinutes();
    return Time(value: totalMinutes.toDouble(), unit: TimeUnit.minutes);
  }

  @override
  String toString() {
    return '${value.toStringAsFixed(2)} ${unit.name}';
  }

  @override
  int compareTo(Time other) {
    return toMinutes().compareTo(other.toMinutes());
  }

  /// Converts the time to a map for SQLite.
  Map<String, dynamic> toMap() {
    return {
      'value': value.toString(),
      'unit': unit.toString(),
    };
  }

  /// Creates a time from a map.
  static Time fromMap(Map<String, dynamic> map) {
    return Time(
      value: Decimal.parse(map['value']).toDouble(),
      unit: TimeUnit.values.firstWhere((e) => e.toString() == map['unit']),
    );
  }

  /// Creates a time from a string.
  static Time fromString(String timeString) {
    final parts = timeString.split(' ');
    final value = Decimal.parse(parts[0]).toDouble();
    final unit = TimeUnit.values.firstWhere((e) => e.name == parts[1]);
    return Time(value: value, unit: unit);
  }
}
