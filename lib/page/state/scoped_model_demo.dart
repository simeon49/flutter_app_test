/**
 * 通过scoped_model 管理状态
 */
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelDemo extends StatelessWidget {
  const ScopedModelDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Scoped Model 管理状态')),
        body: CounterWraper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          builder: (context, child, model) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: model.increment,
            );
          },
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
    return Container(
      child: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return ActionChip(
            avatar: Icon(Icons.add),
            label: Text(
              '${model.counter}',
              style: TextStyle(fontSize: 32.0, color: Colors.blue),
            ),
            onPressed: model.increment
          );
        },
      ),
    );
  }
}

class CounterModel extends Model {
  int _count = 0;

  int get counter => _count;

  void increment() {
    _count ++ ;

    notifyListeners();
  }
}
