import 'package:reqs_app_backend/src/models/time_unit.dart';

extension TimeUnitExtension on TimeUnit {
  String get name {
    switch (this) {
      case TimeUnit.minutes:
        return 'minutes';
      case TimeUnit.hours:
        return 'hours';
      case TimeUnit.days:
        return 'days';
      case TimeUnit.weeks:
        return 'weeks';
    }
  }
}
