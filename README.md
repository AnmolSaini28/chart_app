# Chart App

This is a Flutter application that displays a chart using data from an API. The app fetches and visualizes monthly crude oil processed by refineries data.

## Features

- Fetch data from an API.
- Display data in a bar chart.
- Navigate between home and chart screens with animations.

## Screenshots

Include some screenshots of the app here to give a visual overview.

## Getting Started

These instructions will help you set up and run the app on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart](https://dart.dev/get-dart)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- An emulator or a physical device connected to your machine

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/AnmolSaini28/chart_app.git
   cd chart_app


Folder Structure
chart_app/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   └── chart_data.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── widgets/
│   │   └── chart_widget.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── chart_screen.dart
│   ├── main.dart
├── pubspec.yaml


Key Files
-> main.dart: The entry point of the Flutter application.
-> chart_data.dart: The model class representing the data structure for the chart.
-> api_service.dart: Contains the logic for fetching data from the API.
-> chart_widget.dart: Defines the widget for displaying the chart.
-> home_screen.dart: The home screen of the app with navigation to the chart screen.
-> chart_screen.dart: The screen displaying the chart with data.
