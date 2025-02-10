import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'song.dart';

class MyAppState extends ChangeNotifier {
  var favorites = <Song>[];
  List<Song> songs = [];

  Future<void> loadSongs() async {
    // Charge le fichier JSON
    final String response = await rootBundle.loadString('assets/songs.json');
    final List<dynamic> data = json.decode(response);

    // Convertit chaque élément en objet Song
    songs = data.map((songData) {
      return Song(
        title: songData['title'],
        artist: songData['artist'],
        album: songData['album'],
        year: songData['year'],
        cover: songData['cover'], // Ajoutez l'attribut cover
      );
    }).toList();
    notifyListeners();
  }

  void toggleFavorite(Song song) {
    if (favorites.contains(song)) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
    notifyListeners();
  }
}
