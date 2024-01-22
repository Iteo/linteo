import 'package:http/http.dart' as http;
import 'package:linteo_extractor/file_reader.dart';
import 'package:linteo_extractor/version_helper.dart';

const _allLintsUrl = 'https://dart.dev/tools/linter-rules/all';

class RulesDownloader {
  const RulesDownloader(this.workspace);

  final String workspace;

  Future<String> downloadRulesFromDartLang() async => await _download();

  String readAllLintRulesFromLinteo() => FileReader.getFileTrimmedContent('$workspace/lib/all_lint_rules.yaml');

  String readLatestVersionedFile(String version) {
    final helper = VersionHelper(workspace);
    final version = helper.getAnalysisOptionsVersion();

    return FileReader.getFileTrimmedContent('$workspace/lib/analysis_options.$version.yaml');
  }

  Future<String> readAnalysisOptions() async =>
      FileReader.getFileTrimmedContent('$workspace/lib/analysis_options.yaml');

  Future<String> _download() async {
    final uri = Uri.parse(_allLintsUrl);
    final result = await http.get(uri);

    return result.body;
  }
}
