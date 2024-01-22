import 'package:linteo_extractor/on_lints_changed/tmp_file_writter/tmp_file_writter.dart';

class DeletedLintsTmpWritter extends TmpFileWritter {
  DeletedLintsTmpWritter(super.path, super.lints);

  @override
  void writeLine(String lint, int index) {
    buffer.writeln('$index. $lint');
  }
}
