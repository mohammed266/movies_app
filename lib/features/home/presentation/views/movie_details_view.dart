import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/model/movie/movies_model.dart';
import '../manager/movie_details_cubit/movie_details_cubit.dart';
import '../manager/saved_item_cubit/saved_item_cubit.dart';
import 'widgets/movie_details_widgets/movie_details_item.dart';
import 'widgets/movie_details_widgets/recommended_movie_list.dart';
import 'widgets/movie_details_widgets/similar_movie_list.dart';
import 'widgets/movie_details_widgets/trailer_watch.dart';
import 'widgets/movie_details_widgets/users_reviews.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}
class _MovieDetailsViewState extends State<MovieDetailsView> {
  bool isFavorite = false;
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getMovieTrailersList(widget.movieId);
    context.read<MovieDetailsCubit>().getMovieReviews(widget.movieId);
    // Check if the movie is already in the favorites list
    context.read<SavedItemCubit>().loadFavorites().then((_) {
      final favoriteMovies = context.read<SavedItemCubit>().state;
      if (favoriteMovies is SavedItemSuccess) {
        isFavorite = favoriteMovies.favoriteMovies
            .any((movie) => movie.id == widget.movieId);
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: [SystemUiOverlay.bottom]);
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                    Navigator.pop(context);
                  },
                  icon: const Icon(FontAwesomeIcons.circleArrowLeft),
                  iconSize: 28,
                  color: Colors.white,
              ),
              actions: [
                //add to favorite button
                IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      context
                          .read<SavedItemCubit>()
                          .removeFavorite(widget.movieId);
                    } else {
                      context.read<SavedItemCubit>().addFavorite(
                        MovieDbModel(
                          id: widget.movieId,
                          title: context.read<MovieDetailsCubit>().movieDetails?.title ?? '',
                          posterPath: context.read<MovieDetailsCubit>().movieDetails?.posterPath ?? '',
                        ),
                          );
                    }
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ],
              backgroundColor: const Color.fromRGBO(18, 18, 18, 0.5),
              centerTitle: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: const FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: TrailerWatch(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MovieDetailsItem(movieId: widget.movieId),
                  const UsersReviews(),
                  SimilarMovieList(movieId: widget.movieId),
                  RecommendedMovieList(movieId: widget.movieId),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}