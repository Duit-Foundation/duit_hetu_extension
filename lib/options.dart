import 'config.dart';

final class HetuInitOptions {
  Map<String, Function> externalFunctions;
  ExternalHetuConfig config;

  HetuInitOptions({
    required this.config,
    this.externalFunctions = const {},
  });
}
