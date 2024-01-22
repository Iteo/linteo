import 'dart:io';

import 'package:linteo_extractor/on_review_approved/file_builder.dart';
import 'package:linteo_extractor/on_review_approved/file_builder_options.dart';

class VersionedFileWriter {
  VersionedFileWriter({
    required this.workspace,
    required this.rawRules,
    required this.pullRequestUrl,
  });

  final String workspace;
  final String rawRules;
  final String pullRequestUrl;

  void write(String version) {
    final versionedFilename = 'analysis_options.$version.yaml';
    final versionedFileImport = 'include: package:linteo/$versionedFilename';

    final options = FileBuilderOptions(
      rawRules: rawRules,
      pullRequestUrl: pullRequestUrl,
    );

    final builder = FileBuilder(options, workspace);
    final result = builder.build(version);

    final versionedFile = File('$workspace/lib/$versionedFilename');
    versionedFile.writeAsStringSync(result);

    final mainFile = File('$workspace/lib/analysis_options.yaml');
    mainFile.writeAsStringSync(versionedFileImport);
  }
}
