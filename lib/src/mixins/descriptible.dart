mixin Descriptible {
  String _name = "";
  String _description = "";

  get name => _name;
  get description => _description;

  void setName(String name) {
    _name = name;
  }

  void setDescription(String description) {
    _description = description;
  }
}
