import 'package:linteo_extractor/action_runner.dart';
import 'package:linteo_extractor/on_lints_changed/lints_manager.dart';
import 'package:linteo_extractor/on_lints_changed/tmp_file_writter/deleted_lints_tmp_writter.dart';
import 'package:linteo_extractor/on_lints_changed/tmp_file_writter/new_lints_tmp_writter.dart';

class OnLintsChangedRunner extends ActionRunner {
  OnLintsChangedRunner._({
    required super.workspace,
    required this.manager,
  });

  final LintsManager manager;

  static Future<OnLintsChangedRunner> create(String workspace) async {
    final manager = await LintsManager.create(workspace: workspace);

    return OnLintsChangedRunner._(
      manager: manager,
      workspace: workspace,
    );
  }

  @override
  void runAction() {
    final haveLintsChanged = manager.haveLintsChanged();
    if (haveLintsChanged) {
      _onLintsChanged();
    }
  }

  void _onLintsChanged() {
    final lints = manager.getNewLints();
    manager.updateAllLintsFile();
    _createNewLintsTmpFile(lints);
    final deletedLints = manager.getDeletedLints();
    _createDeletedLintsTmpFile(deletedLints);
  }

  void _createNewLintsTmpFile(List<String> lints) {
    final newLintTmpWritter = NewLintTmpWritter('$workspace/new_lints.tmp', lints);
    newLintTmpWritter.createTmpFile();
  }

  void _createDeletedLintsTmpFile(List<String> lints) {
    final deletedLintsTmpWritter = DeletedLintsTmpWritter('$workspace/deleted_lints.tmp', lints);
    deletedLintsTmpWritter.createTmpFile();
  }
}
