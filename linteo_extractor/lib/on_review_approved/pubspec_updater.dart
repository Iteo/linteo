import 'package:yaml/yaml.dart';

class PubspecUpdater {
  const PubspecUpdater();

  String getPubspecWithUpdatedVersion(
    String currentPubspec,
    String updatedVersion,
  ) {
    final pubspecYaml = loadYaml(currentPubspec) as YamlMap;

    final versionText = pubspecYaml['version'] as String;
    final originalVersion = 'version: $versionText';
    final targetVersion = 'version: $updatedVersion';

    return currentPubspec.replaceFirst(originalVersion, targetVersion);
  }
}
