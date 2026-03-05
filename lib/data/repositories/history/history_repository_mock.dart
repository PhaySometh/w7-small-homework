import 'package:w7_small_homework/data/repositories/history/history_repository.dart';

class HistoryRepositoryMock implements HistoryRepository {
  final List<String> _recentIds = ['101', '102'];
  final List<String> _recommendedIds = ['102', '101'];

  @override
  List<String> fetchRecentSongIds() => List.unmodifiable(_recentIds);

  @override
  List<String> fetchRecommendedSongIds() => List.unmodifiable(_recommendedIds);

  @override
  void addRecentSong(String songId) {
    _recentIds.remove(songId);
    _recentIds.insert(0, songId);
  }
}
