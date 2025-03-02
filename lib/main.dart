import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatsapp/providers/localization_provider.dart';
import 'package:whatsapp/utils/local_storage.dart/local_storage.dart';
import 'package:whatsapp/utils/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLocale = await LocaleStorage.loadLocale();
  final localeController = LocaleController(savedLocale);
  runApp(MyApp(localeController: localeController));
}

class MyApp extends StatelessWidget {
  final LocaleController localeController;
  const MyApp({super.key, required this.localeController});

  @override
  Widget build(BuildContext context) {
    return LocaleProvider(
      localeController: localeController,
      child: AnimatedBuilder(
          animation: localeController,
          builder: (context, _) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              locale: localeController.locale,
              supportedLocales: Localization.supportedLocales,
              localizationsDelegates: const [
                Localization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
    final strings = Localization.of(context).strings;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(strings.greeting, style: const TextStyle(fontSize: 20)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => LocaleProvider.of(context)
                  .setLocale(const Locale('en', 'US')),
              child: const Text("English"),
            ),
            ElevatedButton(
              onPressed: () => LocaleProvider.of(context)
                  .setLocale(const Locale('es', 'ES')),
              child: const Text("Español"),
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
