import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class SongsPage extends StatefulWidget {
  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  @override
  void initState() {
    super.initState();
    // Charger les chansons au démarrage
    final appState = Provider.of<MyAppState>(context, listen: false);
    appState.loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context); // Récupération de l'état

    return Scaffold(
      appBar: AppBar(
        title: Text('All Songs'),
      ),
      body: appState.songs.isEmpty
          ? Center(child: CircularProgressIndicator()) // Affiche un indicateur de chargement
          : ListView.builder(
              itemCount: appState.songs.length,
              itemBuilder: (context, index) {
                final song = appState.songs[index];
                return ListTile(
                  leading: Image.asset(song.cover), // Affiche la couverture
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
                  trailing: IconButton(
                    icon: Icon(appState.favorites.contains(song)
                        ? Icons.favorite
                        : Icons.favorite_border),
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
