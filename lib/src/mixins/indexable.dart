import 'package:uuid/uuid.dart';

mixin Indexable {
  final String _id = Uuid().v4();
  get id => _id;
}
