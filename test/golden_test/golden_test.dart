import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/bottom_bar.dart';
import 'package:golden_test/main.dart';
import 'package:golden_test/test_keys.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

WidgetWrapper customMaterialAppWrapper({
  TargetPlatform platform = TargetPlatform.android,
  Iterable<LocalizationsDelegate<dynamic>>? localizations,
  NavigatorObserver? navigatorObserver,
  Iterable<Locale>? localeOverrides,
  ThemeData? theme,
}) {
  return (child) => ScreenUtilInit(builder: (context, _ ) {
        return MaterialApp(
          localizationsDelegates: localizations,
          supportedLocales: localeOverrides ?? const [Locale('en')],
          theme: theme?.copyWith(platform: platform),
          debugShowCheckedModeBanner: false,
          home: Material(child: child),
          navigatorObservers: [
            if (navigatorObserver != null) navigatorObserver,
          ],
        );
      });
}

void main() {
  setUpAll(() => null);
  setUp(() => null);

  testGoldens('home screen', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(widget: const MyHomePage(title: 'title'));
    await tester.pumpDeviceBuilder(builder,wrapper: customMaterialAppWrapper());
    await screenMatchesGolden(tester, 'home_screen');
  });

  testGoldens('bottom navigation', (tester) async {
    await tester.pumpWidgetBuilder(BottomNavigation(),wrapper: customMaterialAppWrapper());
    await multiScreenGolden(tester, 'bottom_nav');
  });

  testGoldens('tap btn to change avatar', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
          widget: const MyHomePage(title: 'title'),
          name: 'tap change',
          onCreate: (k) async {
            final finder = find.descendant(
                of: find.byKey(k), matching: find.byKey(AppKeys.avatar_btn));
            expect(finder, findsOneWidget);
            await tester.tap(finder);
          })
      ..addScenario(
          widget: const MyHomePage(title: 'title'),
          name: 'tap remove',
          onCreate: (k) async {
            final finder = find.descendant(
                of: find.byKey(k),
                matching: find.byKey(AppKeys.remove_avatar_btn));
            expect(finder, findsOneWidget);
            await tester.tap(finder);
          });
    await tester.pumpDeviceBuilder(builder,wrapper: customMaterialAppWrapper());
    await tester.pumpAndSettle(Duration(seconds: 1));
    await screenMatchesGolden(tester, 'awatar_widget');
  });
}
