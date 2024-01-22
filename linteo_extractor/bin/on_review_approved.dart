import 'package:linteo_extractor/on_review_approved/on_review_approved_runner.dart';

Future<void> main(List<String> args) async {
  final workspace = args[0];
  final rawRules = args[1];
  final pullRequestUrl = args[2];

  final runner = OnReviewApprovedRunner(
    workspace: workspace,
    pullRequestUrl: pullRequestUrl,
    rawRules: rawRules,
  );

  runner.runAction();
}
