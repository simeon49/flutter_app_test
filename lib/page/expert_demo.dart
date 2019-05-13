/**
 * 中高级练习
 */
import 'package:flutter/material.dart';
import './form_demo.dart';
import './material_compents.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './deatetime_demo.dart';
import './dialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snack_bar_demo.dart';
import './expansion_panel_demo.dart';
import 'chip_demo.dart';
import './data_table_demo.dart';
import './data_table_paginated_demo.dart';
import './card_demo.dart';
import './setpper_demo.dart';

// 状态管理
import './state/state_management_demo.dart';
import './state/inherited_widget_demo.dart';
import './state/scoped_model_demo.dart';
import './stream/steam_demo.dart';
import './rxdart/rxdart_demo.dart';
import './bloc/bloc_demo.dart';

// http
import './http/http_demo.dart';

// 动画 animation
import './animation_demo/animation_demo.dart';

// 国际化
import './i18/i18_demo.dart';

class ExperDemo extends StatefulWidget {
  ExperDemo({Key key}) : super(key: key);

  _ExperDemoState createState() => _ExperDemoState();
}

class _ExperDemoState extends State<ExperDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('中高级练习')),
      body: ListView(
        children: <Widget>[
          ListItem(title: '表格 Form', page: FormDemoRoute()),
          ListItem(title: 'material 组件', page: MaterialCompents()),
          ListItem(title: '复选框 CheckBox', page: CheckBoxDemo()),
          ListItem(title: '单选按钮 Radio', page: RadioDemo()),
          ListItem(title: '开关 Switch', page: SwitchDemo()),
          ListItem(title: '滑块 Slider', page: SliderDemo()),
          ListItem(title: '国际化 日期 intl', page: DateTimeDemo()),
          ListItem(title: '对话框 Dialog', page: DialogDemo()),
          ListItem(title: '窗口底部 BottomSheet', page: BottomSheetDemo()),
          ListItem(title: '提示栏 SnackBar', page: SnackBarDemo()),
          ListItem(title: '收缩面板 ExpansionPanel', page: ExpansionPanelDemo()),
          ListItem(title: '小碎片 Chip', page: ChipDemo()),
          ListItem(title: '数据表格 DataTable', page: DataTableDemo()),
          ListItem(title: '数据表格(带分页) DataTable', page: PaginatedDataTableDemo()),
          ListItem(title: '卡片 Card', page: CardDemo()),
          ListItem(title: '步骤 Stepper', page: StepperDemo()),
          // 状态管理
          ListItem(title: '状态管理 StateManager', page: StateManagementDemo()),
          ListItem(title: '继承方式传递参数 InheritedWidget', page: InheritedWidgetDemo()),
          ListItem(title: '通过scoped_model 管理状态', page: ScopedModelDemo()),
          // Stream
          ListItem(title: 'Stream', page: SteamDemo()),
          // RxDart (Reactive Extensions)
          ListItem(title: 'RxDart 响应式编程', page: RxDartDemo()),
          // Bloc 响应式框架
          ListItem(title: 'Bloc 业务逻辑组件', page: BlocDemo()),

          // http
          ListItem(title: 'http', page: HttpDemo()),

          // animation
          ListItem(title: '动画 animation', page: AnimationDemo()),

          // 国际化
          ListItem(title: '国际化 i18', page: I18Demo()),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.title,
    @required this.page
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return page;
          })
        );
      },
    );
  }
}
