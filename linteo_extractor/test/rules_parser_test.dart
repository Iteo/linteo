import 'package:linteo_extractor/on_review_approved/rules_parser.dart';
import 'package:test/test.dart';

void main() {
  test('Should return list of unselected rules (2nd rule)', () {
    const input = '- [x] fake_rule_1\n- [ ] fake_rule_2\n- [x] fake_rule_3';
    const expected = ['fake_rule_2'];
    final result = RulesParser.getUnselectedRules(input);

    expect(result, expected);
  });

  test('Should return list of deleted rules', () {
    const input = 'Test:\n\n1. fake_rule_1\n2. fake_rule_2\n3. fake_rule_3\n\nTest2:\n\n- [ ] dsaas';
    const expected = ['fake_rule_1', 'fake_rule_2', 'fake_rule_3'];
    final result = RulesParser.getDeletedRules(input);

    expect(result, expected);
  });

  test('Should return list of unselected rules (1st, 3rd rules)', () {
    const input = '- [ ] fake_rule_1\n- [x] fake_rule_2\n- [ ] fake_rule_3';
    const expected = ['fake_rule_1', 'fake_rule_3'];
    final result = RulesParser.getUnselectedRules(input);

    expect(result, expected);
  });

  test('Should return list of unselected rules (1st)', () {
    const input = '- [ ] rule_1\n- [x] rule_2';
    const expected = ['rule_1'];
    final result = RulesParser.getUnselectedRules(input);

    expect(result, expected);
  });

  test('Should return empty list', () {
    const input = '- [x] fake_rule_1\n- [x] fake_rule_2\n- [x] fake_rule_3';
    final result = RulesParser.getUnselectedRules(input);

    expect(result, <String>[]);
  });
}
