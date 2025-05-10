import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lang_localization/widgets/lang_selector_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.welcome)),
      body: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.hello),
            LanguageSelector(),
          ],
        ),
      ),
    );
  }
}
