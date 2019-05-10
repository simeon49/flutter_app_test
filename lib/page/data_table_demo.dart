/**
 * 数据表格
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据表格 DataTale')),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,

              columns: [
                DataColumn(
                  label: Text('标题'),
                  // numeric: true,
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a, b) {
                        if (!ascending) {
                          final tmp = a;
                          a = b;
                          b = tmp;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                }),
                DataColumn(label: Text('作者')),
                DataColumn(label: Text('图片')),
              ],
              rows: posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                      post.selected = value;
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(
                      Container(
                        width: 120.0,
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: Image.network(post.imageUrl),
                        )
                      ),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                child: Image.network(post.imageUrl),
                              ));
                          }
                        );
                      }),
                  ]
                );
              }).toList()
            ),
          ]
        )
      )
    );
  }
}
