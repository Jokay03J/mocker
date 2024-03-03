enum Types { string, number }

String? validator(Map<String, dynamic> schema, Map<String, dynamic> datas) {
  for (final propertyName in schema.keys) {
    // check model key name on the body
    final keysExist = datas.keys.contains(propertyName);
    if (schema[propertyName] is String &&
        !schema[propertyName].endsWith('?') &&
        !keysExist) return "$propertyName is missing";

    // check type body property value
    final propertyValue = datas[propertyName];
    switch (schema[propertyName]) {
      case Types.number:
        if (propertyValue is! int || propertyValue is! double) {
          return '$propertyName must be a number';
        }
        break;

      case Types.string:
        if (propertyValue is! String) {
          return '$propertyName must be a string';
        }
        break;
    }
  }

  return null;
}
