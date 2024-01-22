import 'package:linteo_extractor/on_review_approved/rules_appender.dart';
import 'package:test/test.dart';

import 'fixtures/fixture_reader.dart';

void main() {
  final input = fixture('versioned_analysis_options.yaml');

  test('Input should not be modified', () {
    final appender = RulesAppender(input);
    final rules = <String>[];
    const url = 'https://my-pull-request-url';
    final result = appender.build(rules, url);

    expect(result, input);
  });

  test('Should append two rules', () {
    final expected = fixture('versioned_analysis_options_modified.yaml');

    final appender = RulesAppender(input);
    final rules = <String>['my_rule_1', 'my_rule_2'];
    const url = 'https://my-pull-request-url';
    final result = appender.build(rules, url);

    expect(result, expected);
  });
}
