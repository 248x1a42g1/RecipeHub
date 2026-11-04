# RecipeHub 🍽️

## Flutter Recipe Application

### Project Overview

RecipeHub is a Flutter-based Android recipe application developed as a college group project by a team of two students.

The application allows users to explore recipes, view recipe details, add their own recipes, and manage favourite recipes.

The project demonstrates Flutter UI development, Provider state management, local data storage, form validation, and GitHub team collaboration.

### Features

- **Recipe Browsing:** Users can browse available recipes.
- **Recipe Details:** Displays recipe ingredients and preparation steps.
- **Add Personal Recipes:** Users can add their own recipes.
- **Favourite Recipes:** Users can mark and view favourite recipes.
- **Profile Screen:** Provides a profile interface.
- **About Screen:** Displays information about the application.
- **Form Validation:** Validates recipe input fields.
- **Local Data Persistence:** Supports saving application data locally.

### Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Mobile application development |
| Dart | Programming language |
| Provider | State management using ChangeNotifier |
| SharedPreferences | Local data persistence |
| Android Studio | Development and testing |
| Git and GitHub | Version control and collaboration |

### Application Screens

The application includes the following functional screens:

- **Home Screen:** Displays available recipes.
- **Recipe Details Screen:** Displays recipe ingredients and preparation steps.
- **Add Recipe Screen:** Allows users to add personal recipes.
- **Favorites Screen:** Displays favourite recipes.
- **Profile Screen:** Provides profile-related information.
- **About Screen:** Displays application information.

### Project Structure

```text
RecipeHub_Flutter_Project/
├── android/
├── assets/
├── lib/
│   ├── models/
│   │   └── recipe.dart
│   ├── providers/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│   └── main.dart
├── screenshots/
│   ├── home.png
│   ├── details.png
│   ├── favorites.png
│   └── add_recipe.png
├── test/
├── .gitignore
├── analysis_options.yaml
├── DEFECT_LOG.md
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

### Data Source and Storage

RecipeHub allows users to browse recipes and view their details.

The application uses SharedPreferences for local data persistence.

The exact recipe data source or API name is not confirmed in the current project information. If the application uses an external API, its name and website should be added here.

### Installation and Setup

#### Prerequisites

- Flutter SDK
- Dart SDK included with Flutter
- Android Studio or VS Code
- Android SDK
- Android emulator or physical Android device

#### Clone the Repository

```bash
git clone https://github.com/248x1a42g1/RecipeHub.git
cd RecipeHub
```

#### Install Dependencies

```bash
flutter pub get
```

#### Run the Application

```bash
flutter run
```

#### Run Code Analysis

```bash
flutter analyze
```

#### Run Automated Tests

```bash
flutter test
```

#### Build Release APK

```bash
flutter build apk --release
```

The generated APK will be located at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### Team Members and Contributions

| Team Member | College ID | Contributions |
|---|---|---|
| TUMMALA VENKATESWARLU | 248x1a42g1 | Project planning and coordination, GitHub repository management, core application development, recipe feature integration, Provider state management, application testing, and final project integration. |
| SARKA VENKATESH | 248x1a42d7 | Profile screen development, About screen development, UI implementation, screen integration, and application testing. |

### GitHub Collaboration Workflow

The team followed a collaborative development process using Git and GitHub to manage the RecipeHub project.

- The project source code was maintained in the GitHub repository.
- Team members worked on their assigned features and responsibilities.
- Git was used to track changes and maintain the project history.
- Code changes were committed and pushed to the GitHub repository.
- The team coordinated the integration of individual features into the application.
- The application was tested after integrating the developed features.
- The README and project documentation were maintained to describe the application and team contributions.

#### Major Feature Branches Included

- `feature/recipe-browsing`
- `feature/recipe-details`
- `feature/add-recipe`
- `feature/favorites`
- `feature/profile-screen`
- `feature/about-screen`

### Testing and Validation

The following areas are included in the project testing checklist:

| Test Case | Result |
|---|---|
| Recipe browsing | Passed |
| Recipe details | Passed |
| Add recipe validation | Passed |
| Favourite recipes | Passed |
| Profile and About screens | Passed |
| Local data persistence | Passed |
| Flutter analysis | Passed |
| Automated tests | Passed |

### Error Handling

RecipeHub includes input validation and error handling to improve application reliability and provide a better user experience.

- **Form Validation:** Required recipe fields are validated before a recipe is submitted. If a required field is empty or invalid, the application displays a validation message and prevents submission.
- **Missing Recipe Data:** The application checks whether recipe information is available before displaying recipe details. If recipe data is missing, an appropriate message can be displayed instead of showing incomplete information.
- **Local Data Storage:** SharedPreferences is used to store supported application data locally. Storage operations should be handled safely to prevent unexpected application failures.
- **Invalid User Input:** The application validates user-entered recipe information to help prevent incomplete or incorrect data from being saved.
- **User Feedback:** Validation messages and error notifications help users understand what went wrong and how to correct the issue.

These error-handling measures help improve the stability, usability, and reliability of the RecipeHub application.

### Known Limitations

The current project information does not specify known application limitations.

Add any remaining issues or limitations discovered during testing.

### Application Screenshots

#### 1. Home Screen

#### 2. Recipe Details

#### 3. Favorites

#### 4. Add Recipe Screen

### Release APK

**RecipeHub v1.0.1** has been built and prepared for Android.

- **Version:** 1.0.1
- **Platform:** Android
- **APK Filename:** RecipeHub_v1.0.1.apk
- **APK Size:** To be confirmed
- **Status:** To be confirmed

### What's New in v1.0.1

- Added recipe browsing and recipe details.
- Added the ability to save favorite recipes.
- Added the ability to add new recipes.
- Existing recipe features and design remain available.

### Download APK

[Download RecipeHub v1.0.1](https://github.com/248x1a42g1/RecipeHub/releases/tag/v1.0.1)

### Defect Log

The project contains a `DEFECT_LOG.md` file.

Document each issue with its reproduction steps, resolution, and status.

| Issue | Steps to Reproduce | Resolution | Status |
|---|---|---|---|
| Recipe form validation | Submit the add recipe form with required information missing | Verify the implemented validation behavior | To be confirmed |
| Local data persistence | Save data, restart the application, and check whether it remains | Verify the implemented persistence behavior | To be confirmed |

### Future Enhancements

- Improved recipe search and filtering options.
- Additional recipe categories.
- Enhanced recipe organization.
- Further accessibility and UI improvements.
- More detailed recipe management features.

### Conclusion

RecipeHub demonstrates the development of a functional Flutter recipe application using Provider state management, local data persistence, validated forms, and recipe-related interfaces.

The application allows users to browse recipes, view recipe details, add personal recipes, and manage favourite recipes.

The application was developed collaboratively by two team members using GitHub for version control and project coordination.

### Repository

[https://github.com/248x1a42g1/RecipeHub](https://github.com/248x1a42g1/RecipeHub)
