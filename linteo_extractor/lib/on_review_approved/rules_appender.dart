class RulesAppender {
  const RulesAppender(this.currentRawRulesFile);

  final String currentRawRulesFile;

  String build(List<String> rules, String pullRequestUrl) {
    final buffer = StringBuffer();
    buffer.writeln(currentRawRulesFile);
    buffer.writeln();
    for (final rule in rules) {
      buffer.writeln('    # $pullRequestUrl');
      buffer.writeln('    $rule: false');
      buffer.writeln();
    }

    final value = buffer.toString();

    return value.trim();
  }
}
