# RecipeHub — Flutter Group Project

RecipeHub is an Android recipe application implemented to address the mandatory requirements in the Flutter Application Development Programme project specification.

## Features
- Recipe list from DummyJSON public recipe API.
- List loading, error/retry, empty and data states.
- Search and cuisine/category filtering.
- Recipe detail view with ingredients and instructions.
- Validated form for user-created recipes.
- Personal recipes and favourites persist locally using SharedPreferences.
- Shared application state using Provider and ChangeNotifier.
- Consistent Material 3 theme.
- Widget/model test.

## Requirements
- Flutter stable 3.35 or newer
- Dart with null safety
- Android Studio, Android SDK and JDK 17
- Internet for initial API recipe loading

## Run
1. Install Flutter and configure Android Studio/Android SDK.
2. Unzip the project.
3. Open a terminal in the `recipehub` folder.
4. Run:
   ```bash
   flutter pub get
   flutter create . --platforms=android
   flutter run
   ```
   `flutter create` generates Android platform scaffolding if it is not present.
5. Run tests:
   ```bash
   flutter test
   ```
6. Create a release APK:
   ```bash
   flutter build apk --release
   ```
   APK output: `build/app/outputs/flutter-apk/app-release.apk`

## Data source
DummyJSON Recipes API: https://dummyjson.com/recipes

Personal recipes and favourite IDs are stored on the device. API access requires an internet connection. The app can still display locally saved recipes when the API is unavailable.

## Suggested GitHub workflow
Create a public repository and commit work regularly from every team member. Do not commit API keys or private credentials.

## Team contributions
- Member 1: [name and owned screens/features]
- Member 2: [name and owned screens/features]
- Member 3: [name and owned screens/features]

## Defect log
Record each issue found, steps to reproduce, and whether it is fixed before submission.

## Demonstration outline (5 minutes)
- 0:00–0:30: audience and problem
- 0:30–3:30: live recipe flow, demonstrate rejected form entry and error/empty state
- 3:30–4:30: technical challenge and solution; every member speaks
- 4:30–5:00: GitHub commit history and APK
