Map<String, dynamic> removeNullFields(Map<String, dynamic> input) {
  return Map.fromEntries(
    input.entries.where((entry) => entry.value != null),
  );
}
