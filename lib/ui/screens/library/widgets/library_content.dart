import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/core/widgets/song_tile.dart';
import 'package:w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:w7_small_homework/ui/states/settings_state.dart';
import 'package:w7_small_homework/ui/theme/theme.dart';

// • Delegate all presentation logic to LibraryViewModel.
// • Keep the widget purely declarative.

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // • Read only LibraryViewModel and AppSettingsState.
    final viewModel = context.watch<LibraryViewModel>();
    final settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.songs[index],
                isPlaying: viewModel.currentSong == viewModel.songs[index],
                onTap: () => viewModel.playSong(viewModel.songs[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}