/**
 * 状态管理
 */
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状态管理')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TapboxA(),
            TapboxB(),
          ],
        ),
      )
    );
  }
}


// -------------------- Tapbox A --------------------
/**
 * Widget管理自己的state
 */
class TapboxA extends StatefulWidget {
  TapboxA({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _isActive = false;

  void _handleTap() {
    setState(() {
      this._isActive = !this._isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            this._isActive ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 100.0,
        color: this._isActive ? Colors.lightGreen[700] : Colors.grey[600],
      ),
    );
  }
}


// -------------------- Tapbox B --------------------
/**
 * 父widget管理子widget的state
 */
class TapboxB extends StatefulWidget {
  bool _isActive = false;

  TapboxB({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapboxBState();
  }
}

class _TapboxBState extends State<TapboxB> {
  bool _isActive = false;

  void changeState(isActive) {
    setState(() {
      this._isActive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TapBoxB(isActive: this._isActive, changeState: this.changeState);
  }
}

class _TapBoxB extends StatelessWidget {
  final bool isActive;
  final Function changeState;

  _TapBoxB({ Key key, this.isActive: false, @required this.changeState}) : super(key: key);

  void _handleTap() {
    this.changeState(!this.isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            this.isActive ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 100.0,
        color: this.isActive ? Colors.lightGreen[700] : Colors.grey[600],
      ),
    );
  }
}
