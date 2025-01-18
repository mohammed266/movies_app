import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_lacator.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import '../../../auth/presentation/manager/auth_cubit.dart';
import 'widgets/home_widgets/custom_drawer.dart';
import 'widgets/home_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        child: const CustomDrawer(),
      ),
      body: SafeArea(
        child: HomeViewBody(scaffoldKey: scaffoldKey),
      ),
    );
  }
}
