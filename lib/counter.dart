import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  @override
  State<StatefulWidget> createState() {
    return new _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    debugPrint('initState');
    super.initState();

    _counter = widget.initValue;
  }

  /**
   * 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
   * 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。正如之前所述，
   * Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
   * 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
   */
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  /**
   * 当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，
   * 如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
   * 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
   */
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('deactivate');
  }

  /**
   * 当State对象从树中被永久移除时调用；通常在此回调中释放资源
   */
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  /**
   * 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
   */
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  /**
   * 当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，然后在之后的build()
   * 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
   * 典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  void _incrementCounter() {
    setState(() {
      this._counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.display1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this._incrementCounter,
        tooltip: 'Increment Counter',
        child: Icon(Icons.add)
      )
    );
  }
}
