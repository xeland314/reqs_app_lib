import 'package:reqs_app_backend/src/mixins/descriptible.dart';
import 'package:reqs_app_backend/src/mixins/extra_timeable.dart';
import 'package:reqs_app_backend/src/mixins/indexable.dart';
import 'package:reqs_app_backend/src/interfaces/jsonable.dart';
import 'package:reqs_app_backend/src/mixins/orderable.dart';
import 'package:reqs_app_backend/src/mixins/timestampable.dart';

abstract class ExtraTask
    with Indexable, Orderable, Descriptible, ExtraTimeable, Timestampable
    implements Jsonable {
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'extraTime': extraTime,
      'order': order,
    };
  }
}
