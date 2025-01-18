import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../data/repos/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;
  Future<void> createSession(Map<String, dynamic> requestBody) async {
    emit(AuthLoading());
    final result = await authRepo.createSession(requestBody);

    result.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (sessionId) => emit(AuthSuccess(sessionId: sessionId)),
    );
  }

  Future<void> deleteSession(Map<String, dynamic> requestBody) async {
    emit(AuthLoading());
    final result = await authRepo.deleteSession(requestBody);
    result.fold(
          (failure) => emit(LogoutFailure(failure.message)),
          (success){
            SharedPrefHelper.removeData(key: SharedPrefKeys.sessionId);
            SharedPrefHelper.removeData(key: SharedPrefKeys.userName);
            SharedPrefHelper.removeData(key: SharedPrefKeys.pass);
            emit(LogoutSuccess());
          }
    );
  }
}


