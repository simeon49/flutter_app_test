/**
 * 事件
 */
import 'package:flutter/material.dart';

class Event01Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Event01TestRoute();
  }
}

class _Event01TestRoute extends State<Event01Test> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('原始指针事件')),
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          // width: 300.0,
          height: 150.0,
          child: Text(_event?.toString() ?? '', style: TextStyle(color: Colors.white),)
        ),
        onPointerDown: (PointerDownEvent event) => setState(() {this._event = event;}),
        onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
        onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
      ),
    );
  }
}

typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  static EventBus _signleon = EventBus._internal();

  factory EventBus() => _signleon;

  var _emap = Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= List<EventCallback>();
    _emap[eventName].add(f);
  }

  void off(eventName, [EventCallback f]) {
    var lst = _emap[eventName];
    if (eventName == null || lst == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      lst.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var lst = _emap[eventName];
    if (eventName == null || lst == null) return;
    int len = lst.length - 1;
    for (var i = len; i >= 0; i --) {
      lst[i](arg);
    }
  }
}

var bus = EventBus();
