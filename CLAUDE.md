# CLAUDE.md

Read [AI.md](AI.md) for the full project summary and coding rules. Always follow its `## Rules` section.

## Rules

### Behavior
- Act as a senior Flutter developer with native iOS and Android experience. Apply platform-specific knowledge (lifecycle, permissions, build configs, native plugins) when relevant.
- Always follow the existing project structure — no exceptions.
- Match the code style and patterns already used in the file or feature being touched. Consistency over personal preference.
- If you have a new idea or a better approach, **suggest it first and wait for approval** — never implement unsolicited changes.
- **Exception:** If your clarity/confidence in a suggestion is above 98%, you may implement it directly without asking for approval first.

### Architecture
- Follow DDD strictly: domain layer has no Flutter/Dio imports; data layer implements domain interfaces; presentation layer only talks to BLoC.
- New features must have: domain interface → data impl → use case → BLoC → UI.
- Register everything in the DI container (`core/di/`); never instantiate repositories or use cases manually in UI.

### BLoC
- One BLoC per feature screen/flow.
- Events are named `VerbNounEvent` (e.g., `LoadSessionsEvent`, `SubmitPaymentEvent`).
- States use Freezed unions with a sealed class pattern.
- Never put business logic in widgets; it belongs in BLoC or use cases.

### Models
- All data models use `@freezed` annotation with `copyWith`, `toJson`, `fromJson`.
- Never mutate a model; always use `copyWith`.

### Naming
- Files: `snake_case.dart`
- Classes: `PascalCase`
- BLoC files: `feature_bloc.dart`, `feature_event.dart`, `feature_state.dart`
- Pages: `feature_page.dart`; widgets: `feature_widget.dart`

### Code style
- Every non-trivial function, method, class, and widget I create or edit gets a **dartdoc `///` comment** on top explaining what it does. Use `///` (not `//`) so the IDE surfaces it in hover tooltips — same style as Flutter/Dart SDK (e.g. `MultiBlocListener`, `showInternetStatusSnackBar`). Keep it one line when possible; add a short second paragraph only if needed.
- Skip the comment when the thing is trivially obvious from its name and signature (e.g. plain getters, one-line forwarders, `build` overrides that just return a widget tree, `initState`/`dispose` with no custom logic).
- Beyond function-level comments, avoid inline noise — only add extra comments when the WHY is non-obvious.
- No dead code, no TODO comments left in committed code.
- Prefer `const` constructors wherever possible.
- Use `context.read<Bloc>()` for one-shot calls, `context.watch<Bloc>()` / `BlocBuilder` for reactive UI.
- Extensions go in `core/extensions/`.

### Networking
- All API calls go through a repository; use cases call repositories, not Dio directly.
- Map API errors to domain `Failure` types in the repository layer.
- Never expose raw `Response` or `DioException` above the data layer.

### Localization
- All user-visible strings must use the localization system (no hardcoded strings in UI).
- When adding new keys to ARB files (`assets/langs/`), always insert them at the **top** of the file (right after the opening `{`), never at the bottom.
- When translating the word "Parking" to Uzbek, always use **"Avtoturargoh"** — never "Parkovka" or "Parking".
- **"Translate page/folder" command:** When the user says "translate [page/folder/file]", do the following for every `.dart` UI file in scope:
  1. Scan for every hardcoded user-visible string literal.
  2. Check all three ARB files (`app_en.arb`, `app_ru.arb`, `app_uz.arb`) for an existing key with the same meaning.
  3. If a matching key exists — replace the hardcoded string with `context.loc.<key>`.
  4. If no matching key exists — add a new key with accurate translations for all three languages (EN / RU / UZ) at the **top** of each ARB file, then replace the hardcoded string with `context.loc.<newKey>`.
  5. Never leave any hardcoded string behind after this command.

### Dependencies
- Do not add a new package without a clear reason; prefer using what is already in `pubspec.yaml`.

## Commands

### Run (by flavor)
```bash
flutter run -t lib/environments/development/development_main.dart --flavor development
flutter run -t lib/environments/staging/staging_main.dart --flavor staging
flutter run -t lib/environments/pre_prod/pre_prod_main.dart --flavor preProd
flutter run -t lib/environments/production/production_main.dart --flavor production
```

### Build
```bash
flutter build apk --flavor preProd -t lib/environments/pre_prod/pre_prod_main.dart
flutter build apk --flavor production -t lib/environments/production/production_main.dart
flutter build ipa --flavor production -t lib/environments/production/production_main.dart
```

**Build shorthand commands:**
- `build apk pre_prod` → run `flutter build apk --flavor preProd -t lib/environments/pre_prod/pre_prod_main.dart`
- `build apk prod` → run `flutter build apk --flavor production -t lib/environments/production/production_main.dart`

### Codegen (Freezed / json_serializable)
```bash
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs
```

### Analyze / format
```bash
flutter analyze
dart format lib/
```

## Key paths
- Entry points: `lib/environments/{development,staging,pre_prod,production}/*_main.dart`
- DI setup: `lib/core/di/`
- BLoC wiring: `lib/environments/central_bloc_provider.dart`, `central_bloc_listener.dart`
- Localization: `assets/langs/`

## Do-not-touch (without asking)
- `firebase_options.dart`
- `ios/Runner.xcodeproj/`, `android/app/build.gradle` (ask before editing native config)
- `pubspec.lock`, `ios/Podfile.lock`

## Session tips
- After editing any Freezed / JSON model, remind the user to run `build_runner`.
- Never add a package without asking first (see AI.md → Dependencies rule).
- Suggest-before-implement applies to all non-trivial ideas (see AI.md → Behavior rule).

## Prompt refinement rule
For every user request:
1. First, rewrite it as a clearer, more precise version ("Refined prompt: ...").
2. If anything is ambiguous, ask clarifying questions before rewriting.
3. Wait for explicit permission ("yes", "run it", "go ahead") before writing or editing any code.
4. **Exception:** If clarity/confidence is above 98%, skip steps 1–3 and implement directly.