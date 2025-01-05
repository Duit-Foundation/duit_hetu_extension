import 'package:duit_hetu_extension/duit_hetu_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_duit/flutter_duit.dart';

final layout = <String, dynamic>{
  "type": "ElevatedButton",
  "id": "button",
  "controlled": true,
  "action": {
    "executionType": 2, //script
    "script": {
      "sourceCode":
          """fun testFn() {var updateObj = {"type": "update", "updates": {"text": {"style": {"fontSize": 48.0,},},},};return updateObj.toJson();}""",
      "functionName": "testFn",
      // "meta": {},
    }
  },
  "attributes": {},
  "child": {
    "type": "Text",
    "id": "text",
    "controlled": true,
    "attributes": {
      "data": "Hello, Button!",
    }
  }
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final DuitDriver driver;

  @override
  void initState() {
    driver = DuitDriver.static(
      layout,
      transportOptions: HttpTransportOptions(
        baseUrl: "http://localhost:3000",
      ),
    )..applyHetuExtensions(
        HetuInitOptions(
          config: ExternalHetuConfig(),
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DuitViewHost(
        driver: driver,
      ),
    );
  }
}
