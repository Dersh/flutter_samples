import 'dart:async';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:ssl_pinning/root/catcher/report_mode.dart';
import 'package:ssl_pinning/root/models/environment.dart';
import 'package:ssl_pinning/root/models/root_container.dart';

import 'app.dart';

/// General function for initialize main
Future<void> runMain(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = await rootInitializer(environment);

  runZonedGuarded(() {
    final debugOptions = CatcherOptions(AppReportMode(), []);
    final releaseOptions = CatcherOptions(AppReportMode(), []);
    Catcher(
      rootWidget: SslPinningApp(initialRootContainer: container),
      debugConfig: debugOptions,
      releaseConfig: releaseOptions,
      enableLogger: false,
    );
  }, (error, stackTrace) {});
}
