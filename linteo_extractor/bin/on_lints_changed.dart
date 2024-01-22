import 'package:linteo_extractor/on_lints_changed/on_lints_changed_runner.dart';

Future<void> main(List<String> args) async {
  final workspace = args[0];
  final runner = await OnLintsChangedRunner.create(workspace);

  runner.runAction();
}
