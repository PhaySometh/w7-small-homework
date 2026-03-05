abstract class HistoryRepository {
  List<String> fetchRecentSongIds();
  List<String> fetchRecommendedSongIds();

  void addRecentSong(String songId);
}
