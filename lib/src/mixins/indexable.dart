import 'package:uuid/uuid.dart';

mixin Indexable {
  String _id = Uuid().v4();

  get id => _id;

  void setID(String id) {
    _id = id;
  }
}
