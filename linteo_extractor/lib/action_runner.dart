import 'package:meta/meta.dart';

abstract class ActionRunner {
  ActionRunner({required this.workspace});

  final String workspace;

  @protected
  void runAction();
}
