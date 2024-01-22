import 'dart:io';

class FileReader {
  static String getFileTrimmedContent(String path) {
    final result = getFileContent(path);

    return result.trim();
  }

  static String getFileContent(String path) {
    final file = File(path);
    final result = file.readAsStringSync();

    return result.trim();
  }
}
