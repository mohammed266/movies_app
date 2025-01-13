import 'package:dartz/dartz.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../model/tv/tv_series_model.dart';

abstract class TvSeriesRepo {
  Future<Either<Failure, List<TvSeriesModel>>> getPopularTvSeries();
  Future<Either<Failure, List<TvSeriesModel>>> getTopRatedSeries();
  Future<Either<Failure, List<TvSeriesModel>>> getOnAirSeries();


}
