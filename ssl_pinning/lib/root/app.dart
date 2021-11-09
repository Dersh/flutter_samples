import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ssl_pinning/cubits/environment/environment_cubit.dart';
import 'package:ssl_pinning/cubits/environment/environment_state.dart';
import 'package:ssl_pinning/cubits/fraud_notificator/fraud_notificator_cubit.dart';
import 'package:ssl_pinning/cubits/fraud_notificator/fraud_notificator_state.dart';
import 'package:ssl_pinning/root/models/environment.dart';
import 'package:ssl_pinning/root/models/root_container.dart';
import 'package:ssl_pinning/screens/fraud_error_screen.dart';
import 'package:ssl_pinning/screens/home_screen.dart';

class SslPinningApp extends StatelessWidget {
  final RootContainer initialRootContainer;

  const SslPinningApp({Key? key, required this.initialRootContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EnvironmentCubit>(
      create: (_) => EnvironmentCubit(rootContainer: initialRootContainer),
      child: BlocBuilder<EnvironmentCubit, EnvironmentState>(
        builder: (context, state) {
          return MaterialApp(
            key: ValueKey<RootContainer>(state.rootContainer),
            title: 'Ssl pinning Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: MultiProvider(
              providers: [
                BlocProvider<FraudNotificatorCubit>(
                    create: (_) => FraudNotificatorCubit()),
                Provider<Dio>.value(value: state.rootContainer.dio),
                Provider<Environment>.value(
                    value: state.rootContainer.environment),
              ],
              child: BlocBuilder<FraudNotificatorCubit, FraudNotificatorState>(
                builder: (context, state) {
                  return state.when(
                    ok: () => const HomeScreen(),
                    exception: () => const FraudErrorScreen(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
