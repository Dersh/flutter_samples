import 'package:flutter_bloc/flutter_bloc.dart';

import 'fraud_notificator_state.dart';

/// Отвечает за вывод экрана о несовпадении сертификата
class FraudNotificatorCubit extends Cubit<FraudNotificatorState> {
  FraudNotificatorCubit() : super(const FraudNotificatorState.ok());

  /// Выводит экран о несовпадении сертификата
  void toggleFraud() {
    emit(const FraudNotificatorState.exception());
  }
}
