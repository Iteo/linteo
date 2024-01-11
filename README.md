# linteo

<div align="center">

[![License: MIT][license_badge]][license_badge_link]
[![style: linteo][badge]][badge_link]

</div>

---

Provides set of Flutter and Dart linter rules used at [iteo]. By default, package enables all available lint rules (`all_lint_rules.yaml`) and disables some of them upon team agreement.

## Install

1. Depend on this package as a dev_dependency by running `flutter pub add --dev linteo`
2. Create `analysis_options.yaml` file at the root of the package (alongside the pubspec.yaml file) and include: `package:linteo/analysis_options.yaml` from it.


## Which version to use?

| Dart Version | Linteo Version                                                            |
|--------------|-------------------------------------------------------------------------|
| `3.1`        | [`1.3.0`](https://pub.dev/packages/linteo/versions/1.3.0/changelog)|
| `2.17`       | [`1.2.0`](https://pub.dev/packages/linteo/versions/1.2.0/changelog)|
| `2.17`       | [`1.1.0`](https://pub.dev/packages/linteo/versions/1.1.0/changelog)|
| `2.17`       | [`1.0.1`](https://pub.dev/packages/linteo/versions/1.1.0/changelog)|
| `2.18`       | [`1.0.0`](https://pub.dev/packages/linteo/versions/1.0.0/changelog)|
    

### **Example** `analysis_options.yaml` file

```yaml
include: package:linteo/analysis_options.yaml

linter:
  rules:
    # Adjust package to specific project needs
    # package_api_docs: true  # Uncomment to enable rule
```

## Suppress lint

Your project may require special case. Lint rules can be suppressed at the line, file, or project level.

### Line Level

Use an `ignore:` comment directly above the line

```dart
// ignore: public_member_api_docs
class A {}
```

### File level

Use an `ignore_for_file:` comment at the top of the file

```dart

// ignore_for_file: public_member_api_docs

class A {}

class B {}
```

### Project Level

Update root `analysis_options.yaml` according to your needs:

```yaml
include: package:linteo/analysis_options.yaml
linter:
  rules:
    public_member_api_docs: true
```

## Badge

Support the project using a badge in your repository

[![style:linteo](https://img.shields.io/badge/style-linteo-orange)](https://pub.dev/packages/linteo)


[iteo]: https://iteo.com
[badge]: https://img.shields.io/badge/style-linteo-orange
[badge_link]: https://pub.dev/packages/linteo
[license_badge]: https://img.shields.io/badge/licence-MIT-green
[license_badge_link]: https://github.com/Iteo/linteo/blob/master/LICENSE

