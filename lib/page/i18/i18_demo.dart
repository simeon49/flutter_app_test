import 'package:flutter/material.dart';
import './localizations.dart';

/**
 * I18 国际化
 */

class I18Demo extends StatelessWidget {
  const I18Demo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(title: Text('i18 国际化')),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              CustomLocalizations.of(context).title,
              style: Theme.of(context).textTheme.title
            ),
          ],
        ),
      ),
    );
  }
}
