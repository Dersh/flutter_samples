import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ssl_pinning/root/models/root_container.dart';

part 'environment_state.freezed.dart';

@freezed
class EnvironmentState with _$EnvironmentState {
  const factory EnvironmentState.initial({
    required RootContainer rootContainer,
  }) = EnvironmentInitial;
}
