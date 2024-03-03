Map<String, dynamic> getOnly(Map<String, dynamic> object, List<String> keys) {
  final Map<String, dynamic> result = {};
  for (final key in keys) {
    // add to result only if key is present on object
    if (object[key] != null) {
      result[key] = object[key];
    }
  }

  return result;
}
