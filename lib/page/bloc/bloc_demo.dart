/**
 * BloC (Business Logic Componet) 业务逻辑组件
 */
import 'package:flutter/material.dart';

import './counter_with_stream.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counterBloC: CounterBloC(counter: 10),
      child: Scaffold(
        appBar: AppBar(title: Text('Bloc')),
        body: Counter(),
        floatingActionButton: CounterAcionButton(),
      ),
    );
  }
}
