import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/data/repositories/history/history_repository.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:w7_small_homework/ui/screens/home/widgets/home_content.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = HomeViewModel(
          context.read<SongRepository>(),
          context.read<HistoryRepository>(),
          context.read<PlayerState>(),
        );
        viewModel.init();
        return viewModel;
      },
      child: HomeContent(),
    );
  }
}
