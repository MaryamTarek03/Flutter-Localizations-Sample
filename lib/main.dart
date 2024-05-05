import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_example/generated/l10n.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

String lang = 'en';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void changeLang() {
      setState(() {
        lang = lang == 'en' ? 'ar' : 'en';
      });
    }

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(lang),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        onLangChange: changeLang,
      ),
    );
  }
}

int counter = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.onLangChange,
  });

  final void Function() onLangChange;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).title),
        actions: [
          IconButton(
            onPressed: widget.onLangChange,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).text,
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        tooltip: S.of(context).tooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
