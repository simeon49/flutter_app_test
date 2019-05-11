import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

/**
 * 带自加功能的计数器
 */
class Counter extends StatelessWidget {
  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloC _counterBloC = CounterProvider.of(context).counterBloC;

    return Center(
      child: ActionChip(
        avatar: Icon(Icons.add),
        label: StreamBuilder(
          stream: _counterBloC.stream,
          initialData: _counterBloC.counter,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Text(
              // '${snapshot.data}',
              '${_counterBloC.counter}',
              style: TextStyle(fontSize: 32.0, color: Colors.blue),
            );
          },
        ),
        onPressed: () => _counterBloC.add(1)
      ),
    );
  }
}

/**
 * 悬浮按钮
 */
class CounterAcionButton extends StatelessWidget {
  const CounterAcionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloC _counterBloC = CounterProvider.of(context).counterBloC;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _counterBloC.sink.add(1)
    );
  }
}

/**
 * Provider
 */
class CounterProvider extends InheritedWidget {
  CounterProvider({
    Key key,
    @required this.counterBloC,
    this.child
  }) : super(key: key, child: child);

  final Widget child;
  final CounterBloC counterBloC;

  static CounterProvider of(BuildContext context) {

    return (context.inheritFromWidgetOfExactType(CounterProvider)as CounterProvider);
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

/**
 * 业务逻辑组件
 */
class CounterBloC {
  int counter;

  final PublishSubject<int> _subject = PublishSubject();
  Stream<int> stream;

  CounterBloC({
    this.counter=0,
  }) {
    stream = _subject.stream;
  }

  void add(value) {
    counter += value;
    _subject.add(counter);
  }

  void dispose() {
    _subject.close();
  }
}
