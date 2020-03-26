dynamic walkMap(Map<String, dynamic> json, List<String> fields) {
  for (final f in fields) {
    if (json == null || json[f] == null) {
      return null;
    }
    json = json[f];
  }
  return json;
}
