import 'package:linteo_extractor/on_lints_changed/lints_manager.dart';
import 'package:linteo_extractor/rules_downloader.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'fixtures/fixture_reader.dart';

class MockDownloader extends Mock implements RulesDownloader {}

void main() {
  final yamlInput = fixture('linteo_response.yaml');

  late LintsManager manager;
  late RulesDownloader downloader;

  setUp(() async {
    downloader = MockDownloader();
    when(() => downloader.readAllLintRulesFromLinteo()).thenReturn(
      yamlInput,
    );
  });

  test('Should return false, because nothing changed', () async {
    final htmlInput = fixture('options_response.html');
    when(() => downloader.downloadRulesFromDartLang()).thenAnswer(
      (_) => Future<String>.value(htmlInput),
    );

    manager = await LintsManager.create(
      downloader: downloader,
      workspace: '..',
    );

    final result = manager.haveLintsChanged();
    expect(result, false);
  });

  test('Should return true, because something changed', () async {
    final htmlInput = fixture('modified_options_response.html');
    when(() => downloader.downloadRulesFromDartLang()).thenAnswer(
      (_) => Future<String>.value(htmlInput),
    );

    manager = await LintsManager.create(
      downloader: downloader,
      workspace: '..',
    );

    final result = manager.haveLintsChanged();
    expect(result, true);
  });

  test('Should return list of new rules', () async {
    final expected = [
      'fake_rule_1',
      'fake_rule_2',
    ];

    final htmlInput = fixture('modified_options_response.html');
    when(() => downloader.downloadRulesFromDartLang()).thenAnswer(
      (_) => Future<String>.value(htmlInput),
    );

    manager = await LintsManager.create(
      downloader: downloader,
      workspace: '..',
    );

    final result = manager.getNewLints();
    expect(result, expected);
  });

  test('Should return list of deleted rules', () async {
    final expected = [
      'valid_regexps',
      'void_checks',
    ];

    final htmlInput = fixture('modified_options_response.html');
    when(() => downloader.downloadRulesFromDartLang()).thenAnswer(
      (_) => Future<String>.value(htmlInput),
    );

    manager = await LintsManager.create(
      downloader: downloader,
      workspace: '..',
    );

    final result = manager.getDeletedLints();
    expect(result, expected);
  });

  test('Should return empty list of new rules', () async {
    final htmlInput = fixture('options_response.html');
    when(() => downloader.downloadRulesFromDartLang()).thenAnswer(
      (_) => Future<String>.value(htmlInput),
    );

    manager = await LintsManager.create(
      downloader: downloader,
      workspace: '..',
    );

    final result = manager.getNewLints();
    expect(result, <String>[]);
  });
}
