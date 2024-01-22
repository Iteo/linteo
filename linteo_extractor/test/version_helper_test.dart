import 'package:linteo_extractor/version_helper.dart';
import 'package:test/test.dart';

import 'fixtures/fixture_reader.dart';

void main() {
  test('Should return correct version', () {
    const input = 'include: package:linteo/analysis_options.1.3.0.yaml';
    const helper = VersionHelper('..');

    final result = helper.getAnalysisOptionsVersion(input);

    expect(result, '1.3.0');
  });

  test('Should return incremented version', () {
    const helper = VersionHelper('..');
    final text = fixture('input_pubspec.yaml');

    final result = helper.getIncrementedVersion(text);

    expect(result, '1.4.0');
  });
}
