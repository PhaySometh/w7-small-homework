import 'package:flutter/material.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/model/songs/song.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  List<Song> _song = [];

  LibraryViewModel(this._songRepository, this._playerState) {
    _playerState.addListener(_onPlayerChanged);
  }

  // • Expose all UI data through getters.
  List<Song> get songs => _song;
  Song? get currentSong => _playerState.currentSong;

  // Create init() to fetch songs from the repository.
  void init() {
    _song = _songRepository.fetchSongs();
    notifyListeners();
  }

  // • Listen to PlayerState and call notifyListeners() on change.
  void _onPlayerChanged() {
    notifyListeners();
  }

  // • Expose user actions (play, stop, etc.).
  void playSong(Song song) {
    _playerState.start(song);
  }

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerChanged);
    super.dispose();
  }
}
