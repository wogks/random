import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  Random random = Random();
  bool isLoading = true;
  var job = ['a','b','c','d','e','f',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              icon: const Icon(Icons.exposure_minus_1))
        ],
        title: const Text('카운더'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('나의 전생은?',style: TextStyle(fontSize: 50),),
          Center(child: _buildText()),
          ElevatedButton(child: Text('탐색'), onPressed: increase),
        ],
      ),
      
    );
  }

  Widget _buildText() {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return Text(
      job[count],
      style: TextStyle(fontSize: 80),
    );
  }

  Future increase() async {
    setState(() {
      isLoading = true;
    });
    print('clic');
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      count = random.nextInt(5)+1;
      isLoading=false;
    });
  }
}
