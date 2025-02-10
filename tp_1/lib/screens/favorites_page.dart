import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var song in appState.favorites)
          ListTile(
            leading: Image.asset(
              song.cover,
              width: 50, // Ajuste la taille de l'image
              height: 50, // Ajuste la taille de l'image
              fit: BoxFit.cover, // Pour que l'image soit bien centrée dans le carré
            ),
            title: Text(
                          '${song.title}',
                          style: TextStyle(fontWeight: FontWeight.bold), // Met l'artiste en gras
                      ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${song.artist}',
                    style: TextStyle(fontWeight: FontWeight.bold), // Met l'artiste en gras
                  ),
                Text('${song.album}'),
                Text('${song.year}')
              ],
            ),
            trailing: Icon(Icons.favorite, color: Colors.red),
          ),
      ],
    );
  }
}
