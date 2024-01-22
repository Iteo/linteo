import 'package:linteo_extractor/on_review_approved/file_builder.dart';
import 'package:linteo_extractor/on_review_approved/file_builder_options.dart';
import 'package:test/test.dart';

void main() {
  test('Should build correct file', () async {
    const pullRequestUrl = 'https://my-pull-request-url/89745689745';
    const rule1 = 'my_rule_1';
    const rule2 = 'appended_test_rule';
    const rule3 = 'my_rule_2';

    const options = FileBuilderOptions(
      pullRequestUrl: pullRequestUrl,
      rawRules: 'Some PR text:\n- [ ] $rule1\n- [x] $rule2\n- [ ] $rule3',
    );

    const builder = FileBuilder(options, '..');
    final result = builder.build('11.12.13');

    expect(result.contains(rule1), true);
    expect(result.contains(rule2), false);
    expect(result.contains(rule3), true);

    expect(result.contains(pullRequestUrl), true);
  });
}
