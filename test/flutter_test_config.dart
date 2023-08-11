import 'dart:async';
import 'dart:ui';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:golden_toolkit/golden_toolkit.dart';


Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: const [
        Device.phone,
        Device.iphone11,
        Device(size: Size(350, 690), name: 'Samsung'),
      ],
      enableRealShadows: true,
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}
