import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> createSession(Map<String, dynamic> requestBody);
  Future<Either<Failure, bool>> deleteSession(Map<String, dynamic> requestBody);
}
