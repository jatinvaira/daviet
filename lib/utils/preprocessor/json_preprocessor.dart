import 'dart:convert';

class JsonPreprocessor {
  /// Preprocess the JSON string to handle common leniency issues.
  static String preprocessJson(String jsonString) {
    // Remove single-line comments (// ...)
    jsonString = jsonString.replaceAll(RegExp(r'\/\/.*'), '');

    // Remove multi-line comments (/* ... */)
    jsonString = jsonString.replaceAll(RegExp(r'\/\*[\s\S]*?\*\/'), '');

    // Remove trailing commas
    jsonString = jsonString.replaceAll(RegExp(r',\s*([\]}])'), r'$1');

    // Convert single-quoted strings to double-quoted strings
    jsonString = jsonString.replaceAllMapped(RegExp(r"('(?:\\.|[^'\\])*')"), (Match m) {
      return m.group(0)!.replaceAll("'", '"');
    });

    return jsonString;
  }

  /// Leniently decode a JSON string.
  static Map<String, dynamic> lenientJsonDecode(String jsonString) {
    String cleanedJson = preprocessJson(jsonString);
    return jsonDecode(cleanedJson);
  }
}
