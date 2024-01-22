import 'dart:io';

import 'package:linteo_extractor/on_review_approved/rules_parser.dart';

class ChangelogUpdater {
  ChangelogUpdater(this.workspace, this.rawRules);

  final String workspace;
  final String rawRules;

  void update(String version) {
    final file = File('$workspace/CHANGELOG.md');
    final changelogText = file.readAsStringSync();

    final newRules = RulesParser.getSelectedRules(rawRules);
    final disablesRules = RulesParser.getUnselectedRules(rawRules);
    final deletedRules = RulesParser.getDeletedRules(rawRules);

    final buffer = StringBuffer();
    buffer.writeln('## $version');
    buffer.writeln();

    for (final rule in newRules) {
      buffer.writeln('  * Add `$rule` new rule');
    }
    for (final rule in disablesRules) {
      buffer.writeln('  * Disable `$rule` rule');
    }
    for (final rule in deletedRules) {
      buffer.writeln('  * Remove `$rule` due to the removal of the rule from all linter rules');
    }

    buffer.writeln();
    buffer.writeln(changelogText);

    final stringifiedChangelog = buffer.toString();
    final trimmedChangelog = stringifiedChangelog.trim();
    file.writeAsStringSync(trimmedChangelog);
  }
}
