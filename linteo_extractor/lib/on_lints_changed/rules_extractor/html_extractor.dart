import 'package:html/parser.dart';
import 'package:linteo_extractor/on_lints_changed/rules_extractor/rules_extractor.dart';

class HtmlExtractor extends RulesExtractor {
  HtmlExtractor(super.input);

  @override
  String getRawBody() {
    const startCodeTag = '<code>';
    const endCodeTag = '</code></pre>';
    final startIndex = input.lastIndexOf(startCodeTag) + startCodeTag.length;
    final endIndex = input.lastIndexOf(endCodeTag);
    final substring = input.substring(startIndex, endIndex);

    return _parseHtmlString(substring);
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    return parse(document.body?.text ?? '').documentElement?.text ?? '';
  }
}
