import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final numProvider = Provider<int>((ref) {
  return 42;
});

final numStateProvider = StateProvider<int>((ref) {
  return 42;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final number = watch(numProvider);
    final numberState = watch(numStateProvider).state;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Provider: " + number.toString())),
          Center(child: Text("stateProvider: " + numberState.toString())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increment(context),
      ),
    );
  }

  void increment(BuildContext context) {
    context.read(numStateProvider).state++;
  }
}
