import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../manager/movie_details_cubit/movie_details_cubit.dart';

class TrailerWatch extends StatefulWidget {
  const TrailerWatch({
    super.key,
  });

  @override
  State<TrailerWatch> createState() => TrailerWatchState();
}

class TrailerWatchState extends State<TrailerWatch> {
  late YoutubePlayerController _controller;
  late String trailerKey;

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previousState, currentState) {
        // Only rebuild if state changes related to trailers
        return currentState is MovieTrailersLoading ||
            currentState is MovieTrailersSuccess ||
            currentState is MovieTrailersFailure;
      },
      builder: (context, state) {
        if (state is MovieTrailersSuccess) {
          final trailerList = state.movieTrailersList;
          late final String? videoId;
          // If trailerList is not empty, get the key for the first trailer
          if (trailerList.isNotEmpty) {
            trailerKey = trailerList[0].key;
            videoId = YoutubePlayer.convertUrlToId(trailerKey);
            // Update the _controller with the trailer key
            _controller = YoutubePlayerController(
              initialVideoId: videoId!,
              flags: const YoutubePlayerFlags(
                enableCaption: true,
                autoPlay: false,
                mute: false,
                forceHD: true,
              ),
            );
          }

          return FittedBox(
            fit: BoxFit.fill,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: YoutubePlayer(
                thumbnail: trailerList.isNotEmpty
                    ? Image.network(
                        "https://img.youtube.com/vi/$videoId/hqdefault.jpg",
                        fit: BoxFit.cover,
                      )
                    : Container(), // Show a placeholder if no trailers
                controlsTimeOut: const Duration(milliseconds: 1500),
                aspectRatio: 16 / 9,
                controller: _controller,
                showVideoProgressIndicator: true,
                bufferIndicator: const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  ),
                ),
                progressIndicatorColor: Colors.amber,
                bottomActions: const [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: ProgressBarColors(
                      playedColor: Colors.white,
                      handleColor: Colors.amber,
                    ),
                  ),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
            ),
          );
        } else if (state is MovieTrailersFailure) {
          print(state.errMessage);
          return Center(
              child: Text('Failed to load movies ${state.errMessage}'));
        }
        // Default loading indicator
        return const Center(
          widthFactor: 10,
          heightFactor: 10,
          child: CircularProgressIndicator(color: Colors.amber),
        );
      },
    );
  }
}
