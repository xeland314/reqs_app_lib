mixin Timestampable {
  final DateTime _createdAt = DateTime.now();
  DateTime _modifiedAt = DateTime.now();

  DateTime get createdAt => _createdAt;
  DateTime get modifiedAt => _modifiedAt;

  void updateModifiedAt() {
    _modifiedAt = DateTime.now();
  }
}
