import 'dart:io';

import 'package:linteo_extractor/on_review_approved/pubspec_updater.dart';

class PubspecWriter {
  PubspecWriter(this.workspace);

  final String workspace;

  void write(String version) {
    final file = File('$workspace/pubspec.yaml');
    final pubspecText = file.readAsStringSync();

    const updater = PubspecUpdater();
    final updatedPubspec = updater.getPubspecWithUpdatedVersion(
      pubspecText,
      version,
    );

    file.writeAsStringSync(updatedPubspec);
  }
}
