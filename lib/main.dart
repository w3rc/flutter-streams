import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_streams/numList.dart';
import 'package:test_streams/stream.dart';

void addLocator() {
  GetIt.I.registerLazySingleton(() => NumberStream());
}

void main() {
  addLocator();
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  NumberStream get _ns => GetIt.I<NumberStream>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              _ns.addNums(++_counter);
              // print(_counter);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _ns.addNumList([100, 101, 102]);
              // print(_counter);
            },
            tooltip: 'Add List',
            child: Icon(Icons.receipt),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(child: NumList()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    NumberStream().closeStream();
    super.dispose();
  }
}
