import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization1/language_page.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    //--------------import language
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('bn'), Locale('es')],
      path: 'assets/language',
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('bn'),
    //--------------import language/
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //--------------Configaration easy localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //--------------Configaration easy localization/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first_screen'.tr())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'home_page'.tr(),
            style: const TextStyle(fontSize: 50),
          ),
          Text('hello_world'.tr(), style: const TextStyle(fontSize: 40)),
          Row(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LanguagePage(),
                ));
              },
              child: Text('change_language'.tr())),
        ],
      ),
    );
  }
}
