import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ssl_pinning/root/models/config.dart';
import 'package:ssl_pinning/root/models/environment.dart';

class RootContainer {
  final AppConfig config;
  final Environment environment;
  final Dio dio;

  RootContainer(
      {required this.config, required this.dio, required this.environment});
}

/// Returns [RootContainer] with dependencies for given [Environment]
Future<RootContainer> rootInitializer(Environment environment) async {
  final config = environment.config;
  final dio = initializeDio(config);

  return RootContainer(config: config, dio: dio, environment: environment);
}

/// Returns initialized [Dio]
Dio initializeDio(AppConfig config) {
  final dio = Dio(BaseOptions(
      baseUrl: config.apiUrl,
      headers: <String, dynamic>{'content-Type': 'application/json'}));

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    final secureContext = SecurityContext();
    secureContext.setTrustedCertificatesBytes(config.apiCert);
    final client = HttpClient(context: secureContext);
    return client;
  };

  return dio;
}
