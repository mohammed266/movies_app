import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/networking/api_failure.dart';
import '../../../../core/networking/api_service.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> createSession(
      Map<String, dynamic> requestBody) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getRequestToken());
      final token = response['request_token'];
      final loginResponse = await apiService.post(
        endpoint: ApiEndpoints.validateWithLogin(),
        data: {
          'username': requestBody['username'],
          'password': requestBody['password'],
          'request_token': token,
        },
      );
      final sessionResponse = await apiService.post(
        endpoint: ApiEndpoints.createSession(),
        data: {'request_token': loginResponse['request_token']},
      );
      final String sessionId = sessionResponse['session_id'];
      if (sessionId.isNotEmpty) {
        await SharedPrefHelper.setData(
            key: SharedPrefKeys.sessionId, value: sessionId);
        log(sessionId);
      }
      return Right(sessionId);
    } catch (e) {
      return Left(ServerFailure('Failed to create session: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSession(
      Map<String, dynamic> requestBody) async {
    try {
      final String sessionId =
          await SharedPrefHelper.getString(key: SharedPrefKeys.sessionId);
      final response = await apiService.delete(
        endpoint: ApiEndpoints.deleteSession(),
        queryParameters: {
          'username': requestBody['username'],
          'password': requestBody['password'],
          'session_id': sessionId,
        },
      );
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to delete session: $e'));
    }
  }
}
