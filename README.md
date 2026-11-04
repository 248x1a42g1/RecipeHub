# RecipeHub — Flutter Recipe Application

## Project Overview

RecipeHub is a Flutter-based recipe application developed collaboratively by our team. It helps users explore recipes, view recipe details, save their favorite recipes, and manage their cooking interests through a simple and user-friendly interface.

The application uses Provider for state management and local storage to maintain data on the device.

## Project Objectives

- Develop a functional recipe application using Flutter.
- Provide a simple and attractive user interface.
- Implement state management using Provider.
- Store relevant application data locally.
- Support recipe browsing, favorites, and user profile features.
- Practice collaborative software development using Git and GitHub.

## Features

- Browse available recipes.
- View recipe details.
- Add recipes to favorites.
- Manage favorite recipes.
- Add and manage recipes.
- View the user profile.
- Display application information through the About screen.
- Maintain application state using Provider.
- Store data locally on the device.

## Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform application development |
| Dart | Programming language |
| Provider | State management |
| Local Storage | Local data persistence |
| Git | Version control |
| GitHub | Repository hosting and collaboration |

## Project Structure

```text
recipehub/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── providers/
│   ├── screens/
│   └── widgets/
├── assets/
├── test/
├── pubspec.yaml
└── README.md
```

*Note: The structure above is a general overview. Your actual project may contain additional files or folders.*

## Installation and Setup

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- Git

### Steps to Run the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/248x1a42g1/RecipeHub.git
   ```

2. Open the project directory:

   ```bash
   cd RecipeHub
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Screenshots

The following screenshots demonstrate the main application screens.

### Home Screen

![RecipeHub Home Screen](screenshots/home.png)

### Recipe Details Screen

![Recipe Details Screen](screenshots/details.png)

### Favorites Screen

![Favorites Screen](screenshots/favorites.png)

### Add Recipe Screen

![Add Recipe Screen](screenshots/add_recipe.png)

*Note: Check that the image names and paths match the files in your repository. GitHub image paths are case-sensitive.*

## Team Member Contributions

Select a team member below to view their individual contributions.

<details>
<summary><strong>TUMMALA VENKATESWARLU — 248x1a42g1 (Team Leader)</strong></summary>

### Contributions

- Project planning and coordination.
- GitHub repository management.
- Core application development.
- Recipe feature integration.
- Provider state management.
- Application testing.
- Final project integration.

</details>

<details>
<summary><strong>SARKA VENKATESH — 248x1a42d7 (Team Member)</strong></summary>

### Contributions

- Profile screen development.
- About screen development.
- User interface implementation.
- Screen integration.
- Application testing.

</details>

## State Management

RecipeHub uses the Provider package to manage application state. Provider helps separate the application logic from the user interface and allows relevant screens to update when application data changes.

## Data Persistence

The application uses local data persistence to retain relevant information on the device. This allows users to access saved information without needing to enter it again each time the application is opened.

## Testing

The application can be tested using Flutter's testing tools.

Run the following command:

```bash
flutter test
```

Testing focuses on application functionality, screen behavior, state management, and integration.

## Future Enhancements

- Add recipe search and filtering.
- Improve recipe categorization.
- Add user authentication.
- Add cloud-based data synchronization.
- Improve the user interface and accessibility.
- Add more recipe management features.

## Conclusion

RecipeHub demonstrates the development of a functional Flutter recipe application using Provider state management and local data persistence. The project provides practical experience in mobile application development, UI design, state management, testing, and collaborative development using Git and GitHub.

## Repository

[RecipeHub — GitHub Repository](https://github.com/248x1a42g1/RecipeHub)
