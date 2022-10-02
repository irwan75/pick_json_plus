class Pick {
  final String keys;
  final dynamic value;
  final dynamic initialValue;
  Pick({
    required this.keys,
    required this.value,
    required this.initialValue,
  }) : assert(keys.isNotEmpty);
}

Pick pick(Map<String, dynamic> source, String field, {dynamic initialValue}) {
  return Pick(value: source[field], keys: field, initialValue: initialValue);
}
