# Author Library

A Flutter app for searching Open Library authors by name and browsing their works.
Author cards display name, birth date, death date, and top work. Missing metadata
is explicitly shown as unknown or not listed; a missing death date does not imply
the author is alive.

## Requirements

- Flutter 3.44.9 or a compatible stable release with Dart >=3.12.2 <4.0.0
- Android SDK and a device/emulator for Android
- macOS, Xcode, CocoaPods, and an iOS simulator/device for iOS
- An internet connection. No API key or environment file is needed.

## Build and run

Clone this repository, then run from its root:

```sh
flutter doctor
flutter pub get
flutter devices
flutter run -d <device-id>
```

Use the device ID printed by `flutter devices`. To build a release:

```sh
flutter build apk --release
# Android output: build/app/outputs/flutter-apk/app-release.apk
flutter build ios --release --no-codesign
# For App Store distribution, configure signing in Xcode and use flutter build ipa.
```

The checked-in platform targets are Android and iOS. Android's main manifest
includes internet permission so release builds can access the API. iOS uses HTTPS
without an App Transport Security exception. Release distribution requires your
own application identifiers and signing configuration.

## Architecture

```text
lib/
  main.dart                         Application entry point
  app.dart                          MaterialApp and theme
  core/                             Shared typed failure
  features/authors/
    domain/                         Immutable entities, repository contract, use cases
    data/                           Dio API client, validation and entity mapping
    presentation/
      bloc/                         SearchBloc and WorksBloc, events and states
      pages/                        Feature composition, screens and shared widgets
```

Dependencies flow from presentation/data toward domain. The domain has no Flutter
or Dio dependency. `AuthorFeature` is the composition root and owns its Dio client.
It creates `SearchBloc` through a widget-level `BlocProvider`; `WorksPage` creates
its own route-level `BlocProvider`. There are no Bloc providers in `main` or the
application widget. Providers close their Blocs automatically; the feature closes
its Dio client and search closes its debounce timer. Tests can inject a repository
into `AuthorFeature` without HTTP or a global service locator.

Search uses a 400 ms debounce. Each query change immediately advances a request
revision, so a slow earlier response cannot replace the current search, including
while the new query is still debouncing or after clearing. Requests already sent
may finish, but stale results are ignored. Empty input resets the screen. Each
page fetches 20 records; explicit Load more controls avoid unbounded downloads.
Pagination retains results on failure, supports retry, guards duplicate loads,
and deduplicates records by API ID while advancing the raw server offset.

Dio has connection and receive timeouts. Network failures are translated to
user-facing errors; malformed responses fail explicitly. Initial loading, empty,
error, successful, and pagination states are represented in the UI.

## API

[Open Library Authors API](https://openlibrary.org/dev/docs/api/authors):

- `GET /search/authors.json?q=<name>&limit=20&offset=<offset>`
- `GET /authors/<author-id>/works.json?limit=20&offset=<offset>`

Dates are preserved as API strings because records use varying date formats.
Top work is the value supplied by Open Library, rather than a calculated ranking.
The service can omit dates, top work, or first publication dates.

## Model code generation

`Author`, `AuthorWork`, and `PageResult<T>` use Freezed for immutable models,
value equality, and `copyWith`. API validation and mapping stay in the data layer.
Generated `.freezed.dart` files are committed so a fresh checkout can run directly.
After changing model definitions, regenerate them:

```sh
dart run build_runner build
dart format lib test
```

## Validation

```sh
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

Tests cover debounce, stale responses, clearing an active request, retries,
pagination and duplicate-load guards, API mapping, and search-to-works navigation
with an injected repository. Tests do not depend on the public API.

## Publishing

```sh
git remote add origin <your-repository-url>
git push -u origin main
```

Create an empty GitHub or Bitbucket repository first and authenticate with your
Git host. Use its repository URL as the submission link.
