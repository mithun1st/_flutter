import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('second_screen'.tr())),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('language'.tr(),style: const TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => context.setLocale(Locale('en')),
                    child: const Text('English')),
                ElevatedButton(
                    onPressed: () => context.setLocale(Locale('bn')),
                    child: const Text('Bangla')),
                ElevatedButton(
                    onPressed: () => context.setLocale(Locale('es')),
                    child: const Text('Espanion')),
              ],
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('save'.tr())),
          ],
        ));
  }
}
