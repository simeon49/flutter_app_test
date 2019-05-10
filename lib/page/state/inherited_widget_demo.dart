/**
 * inherited_widget 继承方式传递参数
 */
import 'package:flutter/material.dart';

class InheritedWidgetDemo extends StatefulWidget {
  InheritedWidgetDemo({Key key}) : super(key: key);

  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheried(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(title: Text('继承')),
        body: Container(
          child: CounterWraper(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWraper extends StatelessWidget {
  const CounterWraper({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final int count = CounterInheried.of(context).count;
    final VoidCallback increaseCount = CounterInheried.of(context).increaseCount;

    return Container(
      child: ActionChip(
          avatar: Icon(Icons.add),
          label: Text(
            '${count}',
            style: TextStyle(fontSize: 32.0, color: Colors.blue),
          ),
          onPressed: increaseCount),
    );
  }
}

class CounterInheried extends InheritedWidget {
  CounterInheried({
    Key key,
    this.count,
    this.increaseCount,
    this.child
  }) : super(key: key, child: child);

  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  static CounterInheried of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterInheried)
        as CounterInheried);
  }

  @override
  bool updateShouldNotify(CounterInheried oldWidget) {
    return true;
  }
}
