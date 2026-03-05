import 'package:flutter/material.dart';
import 'package:w7_small_homework/data/repositories/history/history_repository.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/model/songs/song.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final HistoryRepository _historyRepository;
  final PlayerState _playerState;

  List<Song> _recentSongs = [];
  List<Song> _recommendedSongs = [];

  HomeViewModel(this._songRepository, this._historyRepository, this._playerState) {
    _playerState.addListener(_onPlayerChanged);
  }

  List<Song> get recentSongs => _recentSongs;
  List<Song> get recommendedSongs => _recommendedSongs;
  Song? get currentSong => _playerState.currentSong;

  void init() {
    _loadSongs();
  }

  void _loadSongs() {
    final recentIds = _historyRepository.fetchRecentSongIds();
    _recentSongs = recentIds
        .map((id) => _songRepository.fetchSongById(id))
        .whereType<Song>()
        .toList();

    final recommendedIds = _historyRepository.fetchRecommendedSongIds();
    _recommendedSongs = recommendedIds
        .map((id) => _songRepository.fetchSongById(id))
        .whereType<Song>()
        .toList();

    notifyListeners();
  }

  void _onPlayerChanged() {
    notifyListeners();
  }

  void playSong(Song song) {
    _historyRepository.addRecentSong(song.id);
    _playerState.start(song);
    _loadSongs();
  }

  void stopSong() {
    _playerState.stop();
  }

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerChanged);
    super.dispose();
  }
}
