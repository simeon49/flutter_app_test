/**
 * 数据表格(带分页)
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  PaginatedDataTableDemo({Key key}) : super(key: key);

  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class PostDataTableSource extends DataTableSource {
  PostDataTableSource({
    @required this.context
  }): assert(context != null);

  final BuildContext context;
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow getRow(index) {
    final post = _posts[index];
    return DataRow(
      selected: post.selected,
      onSelectChanged: (bool value) {
        notifyListeners();
        post.selected = value;
      },
      cells: [
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(
          Container(
            width: 120.0,
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
  }

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void sort(Function compare) {
    _posts.sort((a, b) {
      return compare(a, b);
    });
    notifyListeners();
  }
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    PostDataTableSource _postDataSource = PostDataTableSource(context: context);

    return Scaffold(
      appBar: AppBar(title: Text('数据表格(带分页) DataTale')),
      body: Container(
        width: double.infinity,
        child: PaginatedDataTable(
            header: Text('Posts'),
            rowsPerPage: 7,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                label: Text('标题'),
                // numeric: true,
                onSort: (int index, bool ascending) {
                  _postDataSource.sort((a, b) {
                    if (!ascending) {
                        final tmp = a;
                        a = b;
                        b = tmp;
                      }
                      return a.title.length.compareTo(b.title.length);
                  });

                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = ascending;
                  });
              }),
              DataColumn(label: Text('作者')),
              DataColumn(label: Text('图片')),
            ],
            source: _postDataSource,
          ),
      )
    );
  }
}
