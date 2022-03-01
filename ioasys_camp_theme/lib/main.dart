import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    title: 'Ioasys Camp Theme',
  ));
}

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> switchTheme = ValueNotifier(ThemeMode.light);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: switchTheme,
        builder: (_, mode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ioasys Camp Theme',
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            themeMode: mode,
            home: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                actions: [
                  IconButton(
                    onPressed: () => switchTheme.value = mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    icon: mode == ThemeMode.light
                        ? const Icon(Icons.lightbulb_outline)
                        : const Icon(Icons.lightbulb),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Você clicou:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ), //
            ),
          );
        });
  }
}
