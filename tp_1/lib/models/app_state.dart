import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'song.dart';

class MyAppState extends ChangeNotifier {
  var favorites = <Song>[];

  void toggleFavorite(Song song) {
    if (favorites.contains(song)) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
    notifyListeners();
  }

  List<Song> songs = [
  Song(title: "Song 1", artist: "Artist 1"),
  Song(title: "Song 2", artist: "Artist 2"),
  Song(title: "Song 3", artist: "Artist 3"),
  Song(title: "Song 4", artist: "Artist 4"),
  Song(title: "Song 5", artist: "Artist 5"),
];
}
