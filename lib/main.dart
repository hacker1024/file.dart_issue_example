import 'package:file/memory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _demonstrateBug(BuildContext context) {
    // Create the MemoryFileSystem.
    final fs = MemoryFileSystem();
    // Add a root-level directory.
    fs.directory('/example').createSync();
    try {
      // Add a file. This will fail.
      fs.file('/example/example').createSync();
    } on NoSuchMethodError catch (e) {
      // Show a SnackBar if the error occurs.
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      rethrow;
    }
    // Show a SnackBar if code execution reaches here (it doesn't).
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Done!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to create a filesystem and try and add a file',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _demonstrateBug(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
