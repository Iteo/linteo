import 'package:linteo_extractor/on_review_approved/pubspec_updater.dart';
import 'package:test/test.dart';

import 'fixtures/fixture_reader.dart';

void main() {
  test('Test getPubspecWithUpdatedVersion', () {
    final input = fixture('input_pubspec.yaml');
    const version = '33.44.55';
    final expected = input.replaceAll('version: 1.3.0', 'version: $version');
    const updater = PubspecUpdater();

    final result = updater.getPubspecWithUpdatedVersion(input, version);

    expect(result, expected);
  });
}
