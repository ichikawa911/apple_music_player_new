import 'package:bmp_music/features/library/provider/library_playlist_provider.dart';
import 'package:bmp_music/features/library/views/widgets/playlist_view.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Playlist extends ConsumerWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlists = ref.watch(libraryplaylistProvider);
    return playlists.when(
        data: (data) {
          return ListView.builder(
              padding: const EdgeInsets.only(left: 2),
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PlaylistView(
                  name: data.data![index].attributes!.name.toString(),
                  id: data.data![index].id.toString(),
                );
              },
              itemCount: data.data!.length);
        },
        error: (err, _) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            ));
  }
}
