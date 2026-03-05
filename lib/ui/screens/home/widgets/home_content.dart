import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/core/widgets/song_tile.dart';
import 'package:w7_small_homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:w7_small_homework/ui/states/settings_state.dart';
import 'package:w7_small_homework/ui/theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(child: Text("Home", style: AppTextStyles.heading)),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("Your recent songs", style: AppTextStyles.body),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.recentSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.recentSongs[index],
                isPlaying: viewModel.currentSong == viewModel.recentSongs[index],
                onTap: () => viewModel.playSong(viewModel.recentSongs[index]),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("You might also like", style: AppTextStyles.body),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.recommendedSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.recommendedSongs[index],
                isPlaying: viewModel.currentSong == viewModel.recommendedSongs[index],
                onTap: () => viewModel.playSong(viewModel.recommendedSongs[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}