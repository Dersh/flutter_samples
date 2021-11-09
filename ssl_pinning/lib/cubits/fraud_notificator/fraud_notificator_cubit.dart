import 'package:flutter_bloc/flutter_bloc.dart';

import 'fraud_notificator_state.dart';

class FraudNotificatorCubit extends Cubit<FraudNotificatorState> {
  FraudNotificatorCubit() : super(const FraudNotificatorState.ok());

  void toggleFraud() {
    emit(const FraudNotificatorState.exception());
  }
}
