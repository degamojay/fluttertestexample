import 'package:flutter/material.dart';
import 'package:fluttertestexample/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late Counter counter;

  @override
  void initState() {
    super.initState();
    counter = Counter();
  }


  @override
Widget build(BuildContext context) {
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
          Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40), // Add some spacing
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter.incrementCount();
                  });
                }, 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  minimumSize: const Size(150, 48),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Icon(Icons.add), 
                    SizedBox(width: 8), 
                    Text('Increment'), 
                  ],
                ),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter.decrementCount();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  minimumSize: const Size(150, 48),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Icon(Icons.remove), 
                    SizedBox(width: 8), 
                    Text('Decrement'), 
                  ],
                )
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter.resetCount();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  minimumSize: const Size(150, 48),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Icon(Icons.refresh), 
                    SizedBox(width: 8), 
                    Text('Reset'), 
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

}


