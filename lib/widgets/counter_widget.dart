import 'package:flutter/material.dart';

import 'counter_button.dart';
import 'editable_textfield.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
    this.initialCounter = 20,
    required this.initialText
  }) : super(key: key);

  final int initialCounter;
  final String initialText;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialCounter;
  }

  void _addCounter(int value) {
    setState(() {
      _counter += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    return Card(
      color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EditableTextField(initialText: widget.initialText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterButton(
                child: const Text('-5'),
                onPressed: () {
                  _addCounter(-5);
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              CounterButton(
                child: const Text('+5', style: TextStyle(color: Colors.red),),
                onPressed: () {
                  _addCounter(5);
                },
                color: Colors.red,
              )
            ],
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterButton(
                child: const Text('-1'),
                onPressed: () {
                  _addCounter(-1);
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              CounterButton(
                child: const Text('+1', style: TextStyle(color: Colors.red),),
                onPressed: () {
                  _addCounter(1);
                },
                color: Colors.red,
              )
            ],
          ),
        ],
      ),
    );
  }
}