import 'package:flutter/material.dart';

class LocalHomepage extends StatefulWidget {
  const LocalHomepage({super.key});

  @override
  State<LocalHomepage> createState() => _LocalHomepageState();
}

class _LocalHomepageState extends State<LocalHomepage> {
  int _counterLeftUp = 0;
  int _counterLeftDown = 0;
  int _counterRightUp = 0;
  int _counterRightDown = 0;

  void _incrementLeftUpCounter() {
    setState(() {
      _counterLeftUp++;
    });
  }

  void _incrementLeftDownCounter() {
    setState(() {
      _counterLeftDown++;
    });
  }

  void _incrementRightUpCounter() {
    setState(() {
      _counterRightUp++;
    });
  }

  void _incrementRightDownCounter() {
    setState(() {
      _counterRightDown++;
    });
  }

  void _decrementLeftUpCounter() {
    setState(() {
      _counterLeftUp--;
    });
  }

  void _decrementLeftDownCounter() {
    setState(() {
      _counterLeftDown--;
    });
  }

  void _decrementRightUpCounter() {
    setState(() {
      _counterRightUp--;
    });
  }

  void _decrementRightDownCounter() {
    setState(() {
      _counterRightDown--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Overengeneered Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CounterWidget(
                  counter: _counterLeftUp,
                  onUpTap: _incrementRightDownCounter,
                  onDownTap: _decrementRightDownCounter,
                ),
                _CounterWidget(
                  counter: _counterLeftDown,
                  onUpTap: _incrementRightUpCounter,
                  onDownTap: _decrementRightUpCounter,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CounterWidget(
                  counter: _counterRightUp,
                  onDownTap: _decrementLeftDownCounter,
                  onUpTap: _incrementLeftDownCounter,
                ),
                _CounterWidget(
                  counter: _counterRightDown,
                  onUpTap: _incrementLeftUpCounter,
                  onDownTap: _decrementLeftUpCounter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final int counter;
  final void Function()? onUpTap;
  final void Function()? onDownTap;
  const _CounterWidget({
    required this.counter,
    required this.onUpTap,
    required this.onDownTap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onUpTap,
          child: ColoredBox(
            color: Colors.blue,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Center(child: Icon(Icons.arrow_upward)),
            ),
          ),
        ),
        ColoredBox(
          color: Colors.green,
          child: SizedBox(
            width: 100,
            height: 50,
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onDownTap,
          child: ColoredBox(
            color: Colors.blue,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Center(child: Center(child: Icon(Icons.arrow_downward))),
            ),
          ),
        ),
      ],
    );
  }
}
