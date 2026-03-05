import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:w7_small_homework/ui/screens/library/widgets/library_content.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        // Inject LibraryViewModel (with required repositories and notifiers).
        final viewModel = LibraryViewModel(
          context.read<SongRepository>(),
          context.read<PlayerState>(),
        );
        viewModel.init();
        return viewModel;
      },
      // • Return LibraryContent as child.
      child: LibraryContent(),
    );
  } 
}