import 'package:linteo_extractor/on_review_approved/file_builder_options.dart';
import 'package:linteo_extractor/on_review_approved/rules_appender.dart';
import 'package:linteo_extractor/on_review_approved/rules_parser.dart';
import 'package:linteo_extractor/rules_downloader.dart';

class FileBuilder {
  const FileBuilder(this.options, this.workspace);

  final FileBuilderOptions options;
  final String workspace;

  String build(String version) {
    final downloader = RulesDownloader(workspace);
    final currentFile = downloader.readLatestVersionedFile(version);

    final appender = RulesAppender(currentFile);
    final rules = RulesParser.getUnselectedRules(options.rawRules);

    return appender.build(rules, options.pullRequestUrl);
  }
}
