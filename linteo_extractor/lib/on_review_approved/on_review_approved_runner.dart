import 'package:linteo_extractor/action_runner.dart';
import 'package:linteo_extractor/on_review_approved/changelog_updater.dart';
import 'package:linteo_extractor/on_review_approved/pubspec_writer.dart';
import 'package:linteo_extractor/on_review_approved/rules_parser.dart';
import 'package:linteo_extractor/on_review_approved/versioned_file_writer.dart';
import 'package:linteo_extractor/version_helper.dart';

class OnReviewApprovedRunner extends ActionRunner {
  OnReviewApprovedRunner({
    required super.workspace,
    required this.rawRules,
    required this.pullRequestUrl,
  });

  final String rawRules;
  final String pullRequestUrl;

  @override
  void runAction() {
    final helper = VersionHelper(workspace);
    final String version = helper.getIncrementedVersion();

    _tryUpdateVersionedFile(
      workspace: workspace,
      rawRules: rawRules,
      pullRequestUrl: pullRequestUrl,
      version: version,
    );

    final pubspecWriter = PubspecWriter(workspace);
    pubspecWriter.write(version);

    final changelogUpdater = ChangelogUpdater(workspace, rawRules);
    changelogUpdater.update(version);

    // ignore: avoid_print
    print(version);
  }

  void _tryUpdateVersionedFile({
    required String workspace,
    required String rawRules,
    required String pullRequestUrl,
    required String version,
  }) {
    final hasAnyUnselectedTicks = RulesParser.containsUnselectedRule(rawRules);

    if (hasAnyUnselectedTicks) {
      final versionedFileWriter = VersionedFileWriter(
        workspace: workspace,
        rawRules: rawRules,
        pullRequestUrl: pullRequestUrl,
      );

      versionedFileWriter.write(version);
    }
  }
}
