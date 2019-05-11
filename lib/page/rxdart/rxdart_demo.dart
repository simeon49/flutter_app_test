/**
 * RxDart
 */
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart')),
      body: RxDartHomeDemo(),
    );
  }
}


class RxDartHomeDemo extends StatefulWidget {
  RxDartHomeDemo({Key key}) : super(key: key);

  _RxDartHomeDemoState createState() => _RxDartHomeDemoState();
}

class _RxDartHomeDemoState extends State<RxDartHomeDemo> {

  @override
  void initState() {
    super.initState();

    // debugPrint('============== Observable 可订阅对象 ==============');
    // Observable<String> _obsevable =
    //     // Observable(Stream.fromIterable(['A', 'B', 'C']));
    //     // Observable(Stream.fromFuture(Future.value('Future')));
    //     // Observable(Stream.fromFutures([Future.value('Future'), Future.value('Future')]));
    //     // Observable.fromIterable(['A', 'B', 'C']);
    //     // Observable.just('just');
    //     Observable.periodic(Duration(seconds: 1), (times) => times.toString());

    // _obsevable.listen(debugPrint);


    // debugPrint('============== Subject ==============');
    // /*
    //   PublishSubject: 运行结果:
    //     listnerA: event 3
    //     listnerB: event 4
    //     listnerA: event 4
    // */
    // // PublishSubject<String> _subject = PublishSubject();

    // /*
    //   BehaviorSubject: 运行结果:
    //     listnerA: event 2
    //     listnerA: event 3
    //     listnerB: event 3
    //     listnerB: event 4
    //     listnerA: event 4
    // */
    // // BehaviorSubject<String> _subject = BehaviorSubject();

    // /*
    //   ReplaySubject: 运行结果:
    //     listnerB: event 1
    //     listnerA: event 2
    //     listnerB: event 2
    //     listnerA: event 3
    //     listnerB: event 3
    //     listnerA: event 4
    //     listnerB: event 4
    // */
    // ReplaySubject<String> _subject = ReplaySubject(maxSize: 1); // 限制最大重复个数

    // _subject.add('event 1');
    // _subject.add('event 2');
    // _subject.listen((data) => debugPrint('listnerA: ${data}'));
    // _subject.add('event 3');
    // _subject.listen((data) => debugPrint('listnerB: ${data}'));
    // _subject.add('event 4');

    // _subject.close();

    debugPrint('============== Subject 常用方法 ==============');
    PublishSubject<String> _subject = PublishSubject();
    _subject
      .where((item) => item.length > 10)
      .map((item) => 'item: ${item}')
      .listen((data) => print(data));

    _subject.add('a event');
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
