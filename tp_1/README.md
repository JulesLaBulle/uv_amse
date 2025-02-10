# Music App

## Description

This is a simple music app built using **Flutter**, which allows users to explore a collection of songs, manage their favorites, and view details about albums. The app uses **Provider** for state management and loads song and album data from a **JSON file**. The UI is responsive and adapts to various screen sizes.

## Key Features

- **Song and album data** is loaded from a **JSON file**, allowing easy updates and management.
- **Favorites**: Users can mark songs as favorites and remove them.
- **Responsive UI**: The layout adapts based on the screen size (supports both mobile and tablet views).
- **Navigation**: Easy navigation between pages: Songs, Albums, Favorites, and About.
- **Simple state management** via **Provider** ensures smooth interaction across pages.

## Installation

To run the project on your local machine:

1. Clone the repository and run the app:
   ```bash
   git clone https://github.com/JulesLaBulle/uv_amse.git
   cd uv_amse/tp_1
   flutter pub get
   flutter run
   ```

### Project Structure
- **`assets`** 
  - `images`
  - `songs.json`

- **`lib`**
  - `models`
    - `app_state.dart`
    - `song.dart`
  - `screens`
    - `about_page.dart`
    - `albums_page.dart`
    - `favorites_page.dart`
    - `home_page.dart`
    - `songs_page.dart`
  - `main.dart`
 
- **`analysis_options.yaml`** 
- **`pubspec.yaml`** 


