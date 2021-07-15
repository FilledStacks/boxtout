extension StringHelpers on String {
  String get toCityDocument {
    return this.split(' ').join('-').toLowerCase();
  }
}
