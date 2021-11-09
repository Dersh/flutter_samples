import 'package:ssl_pinning/root/models/config.dart';

enum Environment { prod, dev }

/// Extension on [Environment] to return [Config]
extension EnvironmentConfig on Environment {
  /// Returns [Config] associated with [Environment]
  AppConfig get config {
    switch (this) {
      case Environment.prod:
        return AppConfig.prod;
      case Environment.dev:
        return AppConfig.dev;
    }
  }
}
