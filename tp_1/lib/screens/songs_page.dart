import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../models/song.dart';

class SongsPage extends StatefulWidget {
  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context); // Récupération de l'état

    return Scaffold(
      appBar: AppBar(
        title: Text('All Songs'),
      ),
      body: ListView.builder(
        itemCount: appState.songs.length,
        itemBuilder: (context, index) {
          final song = appState.songs[index];
          return ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist),
            trailing: IconButton(
              icon: Icon(
                appState.favorites.contains(song) ? Icons.favorite : Icons.favorite_border,
                color: appState.favorites.contains(song) ? Colors.red : null,
              ),
              onPressed: () {
                appState.toggleFavorite(song);
              },
            ),
          );
        },
      ),
    );
  }
}

