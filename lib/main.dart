import 'package:easy_local_sample/generated/codegen_loader.g.dart';
import 'package:easy_local_sample/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';

// CodegenLoader 생성(locle 최신화)
// flutter pub run easy_localization:generate -S assets/translations

// LocaleKeys 생성(locle key 최신화) - ko 파일 기준
// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations

// 1.키 중복 확인가능
// 2.언어별 데이터 정합성
// 3.키값 일괄 변경
// 4.변경 데이터 바로 반영
// 5.테스트 용이(context 없이 사용)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  EasyLocalization.logger.enableLevels = [LevelMessages.error, LevelMessages.warning];

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
      ],
      path: 'assets/translations', // <-- 기본은 해당 데이터
      assetLoader: const CodegenLoader(), // 추가 되어있으면 기준이 여기
      // startLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('title').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(LocaleKeys.title3),
            const Text('msg').tr(args: ['Easy localization', 'Dart']),
            const Text('msg_mixed').tr(args: ['Easy localization'], namedArgs: {'lang': 'ABCD'}),
            const Text('gender').tr(gender: 'male', args: ['나난']),
            const Text('gender').tr(gender: 'female', args: ['마마']),
            Text('example.helloWorld'.tr()),
            const Divider(),
            Text(CardFormatType.csn.title),
            const Divider(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum CardFormatType {
  /// Mifare CSN 타입
  csn('CSN', LocaleKeys.csn),

  /// Wiegand 타입
  wiegand('WIEGAND', LocaleKeys.wiegand);

  final String value;
  final String _title;

  String get title => _title.tr();

  const CardFormatType(this.value, this._title);
}
