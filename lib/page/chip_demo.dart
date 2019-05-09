/**
 * 小碎片 Chip
 */
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon'];
  String _selectedTag;
  List<String> _selected = [];
  String _choise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip 小碎片')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // --------- 基本样式 ---------
          Wrap( // 自动换行
            spacing: 8.0, // 水平间距
            runSpacing: 8.0,  // 行间距
            children: <Widget>[
              Chip(label: Text('Simple')),
              Chip(label: Text('Simple'), backgroundColor: Colors.yellow),
              Chip(label: Text('Simple'), avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('S', style: TextStyle(color: Colors.white))
              ),),
              Chip(label: Text('Simple'), avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://resources.ninghao.net/images/wanghao.jpg'
                ),
                child: Text('S', style: TextStyle(color: Colors.white))
              ),),
              Chip(
                label: Text('City'),
                onDeleted: () {},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.redAccent,
                deleteButtonTooltipMessage: 'Remove this tag',
              ),
            ],
          ),
          Divider(color: Colors.black), // 分隔符

          // --------- 删除 ---------
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _tags.map((tag) {
              return Chip(
                label: Text(tag),
                onDeleted: () {
                  setState(() {
                    _tags.remove(tag);
                  });
                },
              );
            }).toList(),
          ),
          Divider(color: Colors.black), // 分隔符

          // --------- ActionChip ---------
          Container(
            width: double.infinity,
            child: Text('Selected: ${_selectedTag}'),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _tags.map((tag) {
              return ActionChip(
                label: Text(tag),
                onPressed: () {
                  setState(() {
                    _selectedTag = tag;
                  });
                },
              );
            }).toList(),
          ),

          // --------- FilterChip ---------
          Container(
            width: double.infinity,
            child: Text('Selected: ${_selected.toString()}'),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _tags.map((tag) {
              return FilterChip(
                label: Text(tag),
                selected: _selected.contains(tag),
                onSelected: (value) {
                  setState(() {
                    if (_selected.contains(tag)) {
                      _selected.remove(tag);
                    } else {
                      _selected.add(tag);
                    }
                  });
                },
              );
            }).toList(),
          ),

          // --------- ChoiceChip ---------
          Container(
            width: double.infinity,
            child: Text('Choice: ${_choise}'),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _tags.map((tag) {
              return ChoiceChip(
                label: Text(tag),
                selected: _choise == tag,
                onSelected: (value) {
                  setState(() {
                    if (_choise == tag) {
                      _choise = null;
                    } else {
                      _choise = tag;
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.redo),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banana', 'Lemon'];
            _selectedTag = null;
            _selected = [];
            _choise = null;
          });
        },
      ),
    );
  }
}
