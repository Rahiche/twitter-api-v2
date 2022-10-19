// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import '../validation_result.dart';
import 'conjunction_required_operator.dart';

class UrlContains extends ConjunctionRequiredOperator {
  /// Returns the new instance of [UrlContains].
  const UrlContains(
    this.value, {
    bool negated = false,
  }) : super(negated);

  factory UrlContains.negated(final String value) =>
      UrlContains(value, negated: true);

  /// The value
  final String value;

  @override
  ValidationResult validate() {
    if (value.isEmpty) {
      return ValidationResult.failed(
        'The value must not be an empty string.',
      );
    }

    return ValidationResult.succeeded();
  }

  @override
  String format() => 'url_contains:${toExactPhraseIfNecessary(value)}';
}
