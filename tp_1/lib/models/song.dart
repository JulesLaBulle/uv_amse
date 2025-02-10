class Song {
  final String title;
  final String artist;
  final String album;
  final int year;
  final String cover;

  Song({required this.title, required this.artist, required this.album, required this.year, required this.cover});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song &&
        other.title == title &&
        other.artist == artist &&
        other.album == album &&
        other.year == year;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        artist.hashCode ^
        album.hashCode ^
        year.hashCode;
  }
}
