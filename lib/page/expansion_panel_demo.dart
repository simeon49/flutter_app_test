/**
 * 收缩面板
 */
import 'package:flutter/material.dart';

class ExpansionPanelItem {
  ExpansionPanelItem({
    @required this.body,
    @required this.headerText,
    this.isExpaned = false
  });

  Widget body;
  String headerText;
  bool isExpaned;
}


class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  List<ExpansionPanelItem> _items = [
    ExpansionPanelItem(
      headerText: 'Panel A',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content od Panel A.'),
      ),
    ),
    ExpansionPanelItem(
      headerText: 'Panel B',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content od Panel B.'),
      ),
    ),
    ExpansionPanelItem(
      headerText: 'Panel C',
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Text('Content od Panel C.'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(title: Text('收缩面板')),
      body: Column(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpaned) {
              setState(() {
                _items[panelIndex].isExpaned = !_items[panelIndex].isExpaned;
              });
            },
            children: _items.map((ExpansionPanelItem item) {
              return ExpansionPanel(
                body: item.body,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(item.headerText)
                  );
                },
                isExpanded: item.isExpaned
              );
            }).toList()
          ),
        ]
      )
    );
  }
}
