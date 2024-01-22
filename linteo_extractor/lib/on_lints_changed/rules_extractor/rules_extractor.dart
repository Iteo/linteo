import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class RulesExtractor {
  RulesExtractor(this.input) {
    final body = getBody();
    _lints = _getLints(body);
  }

  final String input;
  late final List<String> _lints;

  int get lintsCount => _lints.length;

  List<String> get lints => _lints;

  String getLintsHash() {
    final input = _lints.toString();
    final utf8Encoded = utf8.encode(input);
    final digest = md5.convert(utf8Encoded);

    return digest.toString();
  }

  String getBody();

  List<String> _getLints(String body) {
    final rawLints = body.split('-');
    final filteredLints = rawLints.where((element) => element.isNotEmpty);

    final lints = filteredLints.map((element) => element.trim()).toList();
    lints.sort((a, b) => a.compareTo(b));

    return lints;
  }
}
