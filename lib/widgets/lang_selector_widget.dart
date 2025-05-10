import 'package:flutter/material.dart';
import 'package:lang_localization/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: Localizations.localeOf(context),
      items: [
        DropdownMenuItem(value: Locale('en'), child: Text('English')),
        DropdownMenuItem(value: Locale('am'), child: Text('አማርኛ')),
      ],
      onChanged: (Locale? locale) {
        if (locale != null) {
          // You'll need to manage app state to change language
          // This typically involves using a state management solution
          // like Provider, Riverpod, Bloc, etc.
          _updateLocale(context, locale);
        }
      },
    );
  }

  void _updateLocale(BuildContext context, Locale locale) {
    // Assuming you are using a state management solution like Provider
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    localeProvider.setLocale(locale);
  }
}
