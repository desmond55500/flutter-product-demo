# Flutter Product Demo

A public-safe Flutter portfolio app built from scratch to demonstrate production-style mobile engineering without exposing any company source code.

## What it demonstrates

- Feature-based Flutter structure
- ChangeNotifier state management
- Repository abstraction between UI and data
- Typed domain models
- Search and category filtering
- Loading, empty and error-friendly UI states
- Responsive product grid
- Clean navigation between catalog and product details
- Widget tests
- GitHub Actions CI

## Stack

- Flutter / Dart
- Material 3
- Provider
- Repository pattern
- Flutter Test

## Structure

```text
lib/
  app.dart
  main.dart
  core/
    theme.dart
  features/
    catalog/
      data/product_repository.dart
      domain/product.dart
      presentation/catalog_controller.dart
      presentation/catalog_screen.dart
      presentation/product_detail_screen.dart
test/
  catalog_controller_test.dart
```

## Run locally

```bash
flutter pub get
flutter test
flutter run
```

If you cloned this repository without platform folders, generate them once:

```bash
flutter create .
```

Then run the commands above again.

## Architecture

The screen never owns product data directly. It observes a controller, the controller depends on a repository, and the repository is the boundary where a real REST API can later replace the demo data.

```text
UI -> CatalogController -> ProductRepository -> API / local source
```

## Why this project exists

Most of my production mobile work is private. This project demonstrates the same engineering fundamentals in an independent codebase that is safe to review publicly.
