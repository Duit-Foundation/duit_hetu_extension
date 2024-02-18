import 'package:hetu_script/hetu_script.dart';

final class ExternalHetuConfig {
  bool allowImplicitVariableDeclaration,
      allowImplicitNullToZeroConversion,
      allowImplicitEmptyValueToFalseConversion,
      allowVariableShadowing,
      processError,
      showHetuStackTrace,
      removeDocumentation,
      removeAssertion,
      removeLineInfo,
      doStaticAnalysis,
      computeConstantExpression,
      explicitEndOfStatement,
      normalizeImportPath,
      showDartStackTrace,
      printPerformanceStatistics;

  int stackTraceDisplayCountLimit;

  ExternalHetuConfig({
    this.printPerformanceStatistics = true,
    this.normalizeImportPath = true,
    this.explicitEndOfStatement = false,
    this.doStaticAnalysis = false,
    this.computeConstantExpression = false,
    this.removeLineInfo = false,
    this.removeAssertion = false,
    this.removeDocumentation = false,
    this.showDartStackTrace = false,
    this.showHetuStackTrace = false,
    this.stackTraceDisplayCountLimit = 5,
    this.processError = true,
    this.allowVariableShadowing = true,
    this.allowImplicitVariableDeclaration = false,
    this.allowImplicitNullToZeroConversion = false,
    this.allowImplicitEmptyValueToFalseConversion = false,
  });

  HetuConfig toHetuConfig() {
    return HetuConfig(
      printPerformanceStatistics: printPerformanceStatistics,
      normalizeImportPath: normalizeImportPath,
      explicitEndOfStatement: explicitEndOfStatement,
      doStaticAnalysis: doStaticAnalysis,
      computeConstantExpression: computeConstantExpression,
      removeLineInfo: removeLineInfo,
      removeAssertion: removeAssertion,
      removeDocumentation: removeDocumentation,
      showDartStackTrace: showDartStackTrace,
      showHetuStackTrace: showHetuStackTrace,
      stackTraceDisplayCountLimit: stackTraceDisplayCountLimit,
      processError: processError,
      allowVariableShadowing: allowVariableShadowing,
      allowImplicitVariableDeclaration: allowImplicitVariableDeclaration,
      allowImplicitNullToZeroConversion: allowImplicitNullToZeroConversion,
      allowImplicitEmptyValueToFalseConversion:
          allowImplicitEmptyValueToFalseConversion,
    );
  }
}
