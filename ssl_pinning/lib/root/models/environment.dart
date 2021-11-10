import 'package:ssl_pinning/root/models/config.dart';

enum Environment { prod, dev }

extension EnvironmentConfig on Environment {
  /// Выдает конфигурацию относительно окружения
  AppConfig get config {
    switch (this) {
      case Environment.prod:
        return AppConfig.prod;
      case Environment.dev:
        return AppConfig.dev;
    }
  }
}
