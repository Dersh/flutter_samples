import 'package:dio/dio.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssl_pinning/cubits/environment/environment_cubit.dart';
import 'package:ssl_pinning/cubits/home/home_cubit.dart';
import 'package:ssl_pinning/cubits/home/home_state.dart';
import 'package:ssl_pinning/root/models/environment.dart';
import 'package:ssl_pinning/screens/progress_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(dio: context.read<Dio>()),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            HomeContent(
              onCatLoadTap: () => context.read<HomeCubit>().loadCatImage(),
              catUrl: state.catUrl,
              onChangedEnvironment: () =>
                  context.read<EnvironmentCubit>().changeEnvironment(),
              environment: context.read<Environment>(),
            ),
            if (state.isLoading) const ProgressScreen()
          ],
        );
      }),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String? catUrl;
  final Environment environment;
  final VoidCallback onCatLoadTap;
  final VoidCallback onChangedEnvironment;

  const HomeContent(
      {Key? key,
      required this.onCatLoadTap,
      required this.environment,
      required this.onChangedEnvironment,
      this.catUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (catUrl != null)
              FancyShimmerImage(
                imageUrl: catUrl!,
                boxFit: BoxFit.fill,
              ),
            TextButton(onPressed: onCatLoadTap, child: const Text('Load cat')),
            TextButton(
                onPressed: onChangedEnvironment,
                child: const Text('Change environment')),
            Text('Current environment: ${environment.toString()}')
          ],
        ),
      ),
    );
  }
}
