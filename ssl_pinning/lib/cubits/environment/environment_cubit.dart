import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssl_pinning/cubits/environment/environment_state.dart';
import 'package:ssl_pinning/root/models/environment.dart';
import 'package:ssl_pinning/root/models/root_container.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit({required RootContainer rootContainer})
      : super(EnvironmentState.initial(rootContainer: rootContainer));

  /// Yields new state with [RootContainer] for [environment]
  Future<void> changeEnvironment() async {
    final needEnvironment = state.rootContainer.environment == Environment.prod
        ? Environment.dev
        : Environment.prod;

    final rootContainer = await rootInitializer(needEnvironment);
    emit(state.copyWith(rootContainer: rootContainer));
  }
}
