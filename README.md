# MyAffirmationsTest

MyAffirmations is an iOS application designed to display affirmations. Users can select different categories, background colors, gender-specific affirmations, and language settings. Users can also add their own affirmations (in future releases).

## Features

- Display affirmations in various categories
- Support for gender-specific affirmations
- Customizable background colors
- Language localization
- Settings to customize the application
- Add new affirmations (in future releases)

## Requirements

- iOS 16.1+
- Xcode 15.0+
- Swift 5.0+

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/MyAffirmations.git
    ```

2. Open the project in Xcode:

    ```sh
    cd MyAffirmationsTest
    open MyAffirmationsTest.xcodeproj
    ```

3. Build and run the project in the Xcode simulator or on a physical device.

## Usage

### Main Screen

The main screen displays affirmations based on the selected category, background color, and gender settings. Tap the plus icon to add a new affirmation or the settings icon to open the settings screen.

### Adding an Affirmation

To add an affirmation, tap the plus icon on the main screen. A new screen with the message "To be implemented in further releases" will appear. This feature will be available in future updates.

### Settings

The settings screen allows you to customize the app:
- **Category**: Select the category of affirmations.
- **Background Color**: Choose the background color for the app.
- **Gender**: Select gender-specific affirmations.
- **Language**: Opens the device settings to change the language.

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern.

### Models

- `AffirmationsModel`: Decodable model to represent the affirmations data.
- `OnboardingModel`:`Category`, `BGColor`, `Gender` - enums to manage categories, background colors, and gender-specific settings.

### ViewModels

- `OnboardingViewModel`: Handles custom configuration of affirmations.
- `AffirmationViewModel`: Handles the loading of affirmations and updates the view state.
- `SettingsViewModel`: Manages settings and interactions in the settings view.

### Views

- `OnboardingStageView`: Displays onboarding screen if the app is launched for the first time.
- `AffirmationView`: Displays the main screen with the list of affirmations. Has 3 states: loading, loaded, error.
- `SettingsView`: Manages app settings.

## Network Service

The `NetworkService` class handles network requests to fetch affirmations data from a remote source.

## Localization

The app supports localization for different languages. The localization keys are defined in the Localization enum and the respective strings are stored in .strings files.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
