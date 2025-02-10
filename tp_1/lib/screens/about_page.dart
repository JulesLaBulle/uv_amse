import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          """
This music app is built using Flutter and follows a clean architecture pattern with state management via Provider.

Key Features:
- Song and album data are loaded from a JSON file, enabling easy updates and management.
- User favorites are stored in memory, allowing quick access to favorite tracks.
- Responsive UI adapts to screen sizes.
- Simple state management ensures smooth interaction across pages (Songs, Albums, Favorites, About).

The app is designed to be lightweight, fast, and intuitive, making it easy for users to discover and manage their music collection.
""",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.left, // Alignement du texte à gauche
        ),
      ),
    );
  }
}
