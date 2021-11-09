import 'dart:io';

import 'package:catcher/catcher.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssl_pinning/cubits/fraud_notificator/fraud_notificator_cubit.dart';

class AppReportMode extends ReportMode {
  AppReportMode();

  @override
  Future<void> requestAction(Report report, BuildContext? context) async {
    super.onActionConfirmed(report);
    final error = report.error;
    if (error is DioError && error.error is HandshakeException) {
      context!.read<FraudNotificatorCubit>().toggleFraud();
    }
  }

  @override
  bool isContextRequired() => true;

  @override
  List<PlatformType> getSupportedPlatforms() =>
      [PlatformType.web, PlatformType.android, PlatformType.iOS];
}
