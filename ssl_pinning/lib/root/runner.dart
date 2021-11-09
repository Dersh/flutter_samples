import 'package:flutter/material.dart';
import 'package:ssl_pinning/root/models/environment.dart';
import 'package:ssl_pinning/root/models/root_container.dart';

import 'app.dart';

/// General function for initialize main
Future<void> runMain(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = await rootInitializer(environment);
  runApp(SslPinningApp(initialRootContainer: container));
}
