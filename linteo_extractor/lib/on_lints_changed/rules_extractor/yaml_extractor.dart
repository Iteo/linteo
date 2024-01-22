import 'package:linteo_extractor/on_lints_changed/rules_extractor/rules_extractor.dart';

class YamlExtractor extends RulesExtractor {
  YamlExtractor(super.input);

  @override
  String getBody() => input.replaceAll('linter:', '').replaceAll('rules:', '').trim();
}
