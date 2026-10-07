import 'package:json_annotation/json_annotation.dart';
import '../app_failure.dart';

abstract final class JsonParser {
  static T decode<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      return fromJson(json);
    } on CheckedFromJsonException {
      throw const AppFailure(
        'Open Library returned invalid records. Please retry.',
      );
    }
  }
}
