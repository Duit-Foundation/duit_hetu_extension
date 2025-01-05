import 'package:duit_kernel/duit_kernel.dart';
import 'package:hetu_script/hetu/hetu.dart';
import 'package:hetu_script/hetu_script.dart';

import 'options.dart';

final class _HetuScriptRunner extends ScriptRunner<HetuInitOptions> {
  late final Hetu _hetuInstance;

  _HetuScriptRunner({
    required super.runnerOptions,
  });

  @override
  Future<void> initWithTransport(Transport transport) async {
    _hetuInstance = Hetu(
      config: runnerOptions.config.toHetuConfig(),
    )..init(
        externalFunctions: {
          ...runnerOptions.externalFunctions,
          "request": (
            String url,
            Map<String, dynamic> meta,
            Map<String, dynamic> body,
          ) async {
            return await transport.request(
              url,
              meta,
              body,
            );
          }
        },
      );
  }

  @override
  Future<Map<String, dynamic>?> runScript(
    String functionName, {
    String? url,
    Map<String, dynamic>? meta,
    Map<String, dynamic>? body,
  }) async {
    return await _hetuInstance.invoke(
      functionName,
      positionalArgs: [
        url,
        meta,
        body,
      ],
    );
  }

  @override
  Future<void> eval(String source) async {
    await _hetuInstance.eval(source);
  }
}

extension HetuExtension on UIDriver {
  void applyHetuExtensions(HetuInitOptions options) {
    scriptRunner = _HetuScriptRunner(
      runnerOptions: options,
    );
  }
}
