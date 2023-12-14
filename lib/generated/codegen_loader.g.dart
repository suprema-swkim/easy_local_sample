// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ko_KR = {
  "title": "제목",
  "title1": "제목11",
  "title2": "제목22",
  "title3": "제목33",
  "csn": "csn 타입",
  "wiegand": "wiegand 타입",
  "msg": "{} are written in the {} 언어",
  "msg_named": "Easy localization is written in the {lang} 언어",
  "msg_mixed": "{} are written in the {lang} 언어",
  "type": {
    "aType": "안녕 man ;) {}",
    "bType": "안녕 girl :) {}",
    "other": "안녕 {}"
  },
  "example": {
    "hello": "안녕",
    "world": "하세요",
    "helloWorld": "@:example.hello @:example.world"
  }
};
static const Map<String,dynamic> en_US = {
  "title": "title1",
  "title1": "title2",
  "title2": "title3",
  "title3": "title4",
  "csn": "csn type",
  "wiegand": "wiegand type",
  "msg": "{} are written in the {} language",
  "msg_named": "Easy localization is written in the {lang} language",
  "msg_mixed": "{} are written in the {lang} language",
  "type": {
    "aType": "Hi man ;) {}",
    "bType": "Hello girl :) {}",
    "other": "Hello {}"
  },
  "example": {
    "hello": "Hello",
    "world": "World",
    "helloWorld": "@:example.hello @:example.world"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ko_KR": ko_KR, "en_US": en_US};
}
