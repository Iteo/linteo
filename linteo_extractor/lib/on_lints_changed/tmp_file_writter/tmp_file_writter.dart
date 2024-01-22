import 'dart:io';
import 'package:meta/meta.dart';

abstract class TmpFileWritter {
  TmpFileWritter(
    this.path,
    this.lints,
  ) : buffer = StringBuffer();

  final String path;
  final List<String> lints;
  final StringBuffer buffer;

  void createTmpFile() {
    final file = File(path);
    for (int i = 1; i <= lints.length; i++) {
      writeLine(lints[i - 1], i);
    }

    final text = buffer.toString();
    file.writeAsStringSync(text);
  }

  @protected
  void writeLine(String lint, int index);
}
