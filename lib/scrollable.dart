/**
 * 可滑动 Widgets
 */
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as prefix0;

/* -------------------- SingleChildScrollView -------------------- */
class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView')),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("")
                  //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      )
    );
  }
}


/* -------------------- ListViewTestRoute -------------------- */
class ListViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget divider1 = Divider(color: Colors.red);
    final Widget divider2 = Divider(color: Colors.blue);

    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: Scrollbar(
        // child: ListView(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.all(20.0),
        //   children: <Widget>[
        //     const Text('I\'m dedicating every day to you'),
        //     const Text('Domestic life was never quite my style'),
        //     const Text('When you smile, you knock me out, I fall apart'),
        //     const Text('And I thought I was so smart'),
        //     const Text('And I thought I was so smart'),
        //     const Text('And I thought I was so smart'),
        //     const Text('And I thought I was so smart'),
        //     const Text('And I thought I was so smart'),
        //   ],
        // ),

        // child: ListView.builder(
        //   itemCount: 100,
        //   itemExtent: 20.0, //强制高度为50.0
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(title: Text('$index'));
        //   },
        // ),

        child: ListView.separated(
          itemCount: 100,
          shrinkWrap: false,
          // 列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          },
          // 分隔器
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },

        ),
      )
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '###loading###';
  var _words = <String>[loadingTag];
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    this._retrieveData();

    // 监听滚动事件
    this._controller.addListener(() {
      if (this._controller.offset < 1000 && this.showToTopBtn) {
        setState(() {
          this.showToTopBtn = false;
        });
      } else if (this._controller.offset >= 1000 && !this.showToTopBtn) {
        setState(() {
          this.showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: Scrollbar(
        child: Column(
          children: <Widget>[
            ListTile(title: Text('单词列表: '),),
            Expanded(
              child: ListView.builder(
                controller: this._controller,
                itemCount: _words.length,
                itemBuilder: (BuildContext context, int index) {
                  if (this._words[index] == loadingTag) {
                    if (this._words.length - 1 < 100) {
                      this._retrieveData();
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0,)
                        ),
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text('没有更多了', style: TextStyle(color: Colors.grey)),
                      );
                    }
                  }
                  return ListTile(title: Text(this._words[index]));
                }
              )
            )
          ],
        )
      ),
      floatingActionButton: !this.showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          this._controller.animateTo(0.0, curve: Curves.ease, duration: Duration(milliseconds: 200));
        },
      )
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      this._words.insertAll(this._words.length - 1,
        prefix0.generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}


/* -------------------- GridViewTestRoute -------------------- */
class GridViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0 //宽高比为1时，子widget
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      )
    );
  }
}


/* -------------------- GridViewTestRoute -------------------- */
class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "assets/images/pic.jpg", fit: BoxFit.cover,),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}
