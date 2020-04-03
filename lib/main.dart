import 'package:eventos_mvp/src/pages/event_page.dart';
import 'package:eventos_mvp/src/pages/events_page.dart';
import 'package:eventos_mvp/src/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventos',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/'         : (BuildContext context) => HomePage(),
        'events'    : (BuildContext context) => EventsPage(),
        'event'     : (BuildContext context) => EventPage()
      },
      localizationsDelegates: [
          // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'),// Spanish
      ]
    );
  }
}