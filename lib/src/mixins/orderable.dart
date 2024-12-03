mixin Orderable {
  int _order = 0;
  get order => _order;

  void setOrder(int order) {
    _order = order;
  }
}
