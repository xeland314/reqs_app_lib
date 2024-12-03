import 'package:reqs_app_backend/reqs_app_backend.dart';

mixin ExtraTimeable {
  Time _extraTime = Time(value: 0, unit: TimeUnit.minutes);

  Time get extraTime => _extraTime;

  void setExtraTime(Time extraTime) {
    _extraTime = extraTime;
  }
}
