import 'package:easy_local_sample/generated/codegen_loader.g.dart';
import 'package:easy_local_sample/generated/locale_keys.g.dart';
import 'package:easy_localization/src/easy_localization_controller.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A manually created instance of Localization to enable translating without context.
final Localization L = Localization.instance;

/// Method to load translations since context is not available in isolate.
Future<void> loadTranslations(Locale locale) async {
  //this will only set EasyLocalizationController.savedLocale
  await EasyLocalizationController.initEasyLocation();

  final controller = EasyLocalizationController(
    saveLocale: true, //mandatory to use EasyLocalizationController.savedLocale
    fallbackLocale: locale,
    supportedLocales: [locale],
    assetLoader: const CodegenLoader(),
    useOnlyLangCode: false,
    useFallbackTranslations: true,
    path: 'assets/translations',
    onLoadError: (FlutterError e) {},
  );

  //Load translations from assets
  await controller.loadTranslations();

  //load translations into exploitable data, kept in memory
  Localization.load(controller.locale, translations: controller.translations, fallbackTranslations: controller.fallbackTranslations);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('ko_KR 테스트', () {
    setUpAll(() async {
      await loadTranslations(const Locale('ko', 'KR'));
    });
    test('ko_KR 테스트', () {
      expect(L.tr(LocaleKeys.title), CodegenLoader.ko_KR[LocaleKeys.title]);
      expect(L.tr(LocaleKeys.title1), CodegenLoader.ko_KR[LocaleKeys.title1]);
      expect(L.tr(LocaleKeys.title2), CodegenLoader.ko_KR[LocaleKeys.title2]);
    });
  });
  group('en_US 테스트', () {
    setUpAll(() async {
      await loadTranslations(const Locale('en', 'US'));
    });
    test('en_US 테스트', () {
      expect(L.tr(LocaleKeys.title), CodegenLoader.en_US[LocaleKeys.title]);
      expect(L.tr(LocaleKeys.title1), CodegenLoader.en_US[LocaleKeys.title1]);
      expect(L.tr(LocaleKeys.title2), CodegenLoader.en_US[LocaleKeys.title2]);
    });
  });
}
