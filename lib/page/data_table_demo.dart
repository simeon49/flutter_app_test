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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据表格 DataTale')),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('标题'), onSort: (int index, bool ascending) {
                  setState(() {
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
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
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
