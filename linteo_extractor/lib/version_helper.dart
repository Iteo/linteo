import 'package:linteo_extractor/file_reader.dart';
import 'package:yaml/yaml.dart';

class VersionHelper {
  const VersionHelper(this.workspace);

  final String workspace;

  String getAnalysisOptionsVersion([String? analysisOptions]) {
    final text = analysisOptions ?? _getAnalysisOptionsFromFile();

    return text.trim().replaceFirst('include: package:linteo/analysis_options.', '').replaceFirst('.yaml', '');
  }

  String getIncrementedVersion([String? pubspec]) {
    final text = pubspec ?? _getPubspecFromFile();
    final pubspecYaml = loadYaml(text) as YamlMap;

    final version = pubspecYaml['version'] as String;
    final parts = version.split('.');
    parts[1] = _incrementString(parts[1]);

    return parts.join('.');
  }

  String _getAnalysisOptionsFromFile() => FileReader.getFileContent('$workspace/lib/analysis_options.yaml');

  String _getPubspecFromFile() => FileReader.getFileContent('$workspace/pubspec.yaml');

  String _incrementString(String numberText) {
    var minor = int.parse(numberText);
    return '${++minor}';
  }
}
