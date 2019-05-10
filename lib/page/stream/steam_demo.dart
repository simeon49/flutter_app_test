/**
 * Stream
 */
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

class SteamDemo extends StatelessWidget {
  const SteamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream')),
      body: StreamHome(),
    );
  }
}

class StreamHome extends StatefulWidget {
  StreamHome({Key key}) : super(key: key);

  _StreamHomeState createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {
  StreamController <String> _streamController;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();

    // // 允许多个监控
    // _streamController = StreamController.broadcast();
    // _streamController.stream.listen(_onData, onError: _onError, onDone: _onDone, cancelOnError: false);

    _streamController.addStream(Stream.fromFuture(fetchStrData()));
  }

  Future<String> fetchStrData() async {
    await Future.delayed(Duration(seconds: 1));

    int n = Random().nextInt(100);
    debugPrint('${n}');
    if (n > 50) {
      throw 'Something happended';
    }

    return 'Tis is a long string.';
  }

  // void _onData(data) {
  //   debugPrint(data);
  // }

  // void _onError(e) {
  //   debugPrint('Error: ${e}');
  // }

  // void _onDone() {
  //   debugPrint('done.');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: StreamBuilder(
        stream: _streamController.stream ,
        initialData: '等待...' ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasError) {
            return Container(
              child: Text('出错: ${snapshot.error}', style: TextStyle(fontSize: 24.0, color: Colors.red),),
            );
          } else {
            return Container(
              child: Text('${snapshot.data}', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
            );
          }
        },
      ),
    );
  }
}
