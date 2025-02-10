import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class AlbumsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    // Grouper les chansons par album
    final albums = <String, List>{
      for (var song in appState.songs)
        song.album: appState.songs
            .where((s) => s.album == song.album)
            .toList()
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: albums.isEmpty
          ? Center(child: CircularProgressIndicator()) // Si pas de données
          : ListView.builder(
              itemCount: albums.keys.length,
              itemBuilder: (context, index) {
                final album = albums.keys.elementAt(index); // Nom de l'album
                final songs = albums[album] ?? []; // Chansons de l'album
                final artist = songs.first.artist; // Artiste de l'album
                final year = songs.first.year; // Année de l'album
                final cover = songs.first.cover;

                return ListTile(
                  leading: Image.asset(cover),
                  title: Text(album, style: TextStyle(fontWeight: FontWeight.bold)), // Nom de l'album
                  subtitle: Text('$artist - $year'), // Artiste et année
                  onTap: () {
                    // Action quand on clique sur un album (facultatif)
                    // Tu peux afficher les chansons de l'album dans une autre page ici si tu le souhaites.
                  },
                );
              },
            ),
    );
  }
}
