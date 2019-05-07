/**
 * 基本练习
 */
import 'package:flutter/material.dart';
import '../model/post.dart';

/* -------------------- 基础功能 Widgets -------------------- */
/**
 * 文本
 */
class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);

  final String _title = '工作的意义';

  @override
  Widget build(BuildContext context) {
    return Text('''${_title}:
      你为何想要工作？为何工作如此艰辛？如何在工作中找到满足？本书将帮助你寻找这三个问题的答案。凯勒凭借扎实的神学功底以及丰富的牧会经验向读者阐明，基督教的工作观如何，圣经中的智慧何以帮助我们理解并应对工作中那些最棘手的难题，以及如何将信仰与工作结合起来。读者会发现，基督教的工作观，即服侍他人而非服侍自己，是拥有美好职业生涯的关键。
      提摩太·凯勒（Timothy Keller），美国神学家、护教学家，纽约救赎主长老教会牧师。其著作《为何是他》和《一掷千金的上帝》荣登《纽约时报》畅销书排行榜。其他作品包括《婚姻的意义》、《中心教会》、《诸神的面具》、《慷慨的正义》等。
      凯瑟琳·利里·阿尔斯多夫（Katherine Leary Alsdorf），纽约救赎主长老教会信仰与工作中心执行主任，有高科技行业25年的从业经验。''',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 16.0),
      maxLines: 5,
      overflow: TextOverflow.fade,  // ellipsis
    );
  }
}

/**
 * 富文本
 */
class RichTextDeom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(text: 'www.', style: TextStyle(color: Colors.green)),
          TextSpan(text: 'google.', style: TextStyle(color: Colors.blue)),
          TextSpan(text: 'com', style: TextStyle(color: Colors.grey)),
        ]
      ),

    );
  }
}

/**
 * 容器
 */
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight,
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(2, 54, 255, 0.6),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 190.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(2, 54, 255, 0.6),
              border: Border.all(color: Colors.black54, width: 3.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(offset: Offset(20.0, 40.0), color: Colors.amber, blurRadius: 25, spreadRadius: -9.0),
              ],
              // gradient: RadialGradient( // 渐变(半径)
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(128, 28, 64, 1.0),
              //   ]
              // ),
              gradient: LinearGradient( // 渐变(线性)
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(128, 28, 64, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}


/* -------------------- 布局 Widgets -------------------- */
/**
 * 约束盒子
 */
class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100.0, maxWidth: 100.0, maxHeight: 200.0),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

/**
 * 强制宽高比
 */
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0, // 宽:高
        child: Container(
          color: Color.fromRGBO(3, 54, 255, 1.0),
        ),
      ),
    );
  }
}

/**
 * Flex布局(Row, Column)
 */
class FexlDemo extends StatelessWidget {
  const FexlDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconBadge(Icons.ac_unit),
          IconBadge(Icons.brightness_2,size: 128),
          IconBadge(Icons.attach_file),
          IconBadge(Icons.airline_seat_recline_extra, size: 64),
        ],
      )
    );
  }
}

/**
 * 绝对布局
 */
class StackDeom extends StatelessWidget {
  const StackDeom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 100.0,
            top: 30.0,
            child: IconBadge(Icons.ac_unit),
          ),
          Positioned(
            left: 200.0,
            top: 300.0,
            child: IconBadge(Icons.brightness_2,size: 128),
          ),
          Positioned(
            left: 100.0,
            top: 300.0,
            child: IconBadge(Icons.attach_file),
          ),
          Positioned(
            left: 100.0,
            top: 50.0,
            child: IconBadge(Icons.airline_seat_recline_extra, size: 64),
          )
        ],
      )
    );
  }
}

class IconBadge extends StatelessWidget {
  const IconBadge(this.icon, {
    Key key,
    this.size = 32.0,
    this.color = Colors.lightGreen
  }) : assert(size > 10.0)
     , super(key: key);

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        alignment: Alignment(1.0, -0.5),
        color: Colors.blue[900],
        child: Icon(icon, size: size / 2.0, color: color),
      ),
    );
  }
}


/* -------------------- PageView Widgets -------------------- */
/**
 * 滑动视图
 */
class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  SizedBox.expand(child: Image.network(posts[index].imageUrl, fit: BoxFit.cover)),
                  Positioned(
                    bottom: 0.0,
                    right: 10.0,
                    child: Column(
                      children: <Widget>[
                        Text(posts[index].title, style: TextStyle(fontSize: 32.0, color: Colors.black87, fontWeight: FontWeight.bold)),
                        Text(posts[index].author, style: TextStyle(fontSize: 16.0, color: Colors.black38)),
                      ],
                    )
                  )
                ],
              );
            }
          ),
        ),
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            // reverse: true,
            // pageSnapping: false,
            controller: PageController(
              initialPage: 2,
              keepPage: false,
              viewportFraction: 0.85
            ),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.brown[900],
                child: Text('One', style: TextStyle(color: Colors.white, fontSize: 32.0))
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.grey[900],
                child: Text('Two', style: TextStyle(color: Colors.white, fontSize: 32.0))
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.blueGrey[900],
                child: Text('Three', style: TextStyle(color: Colors.white, fontSize: 32.0))
              ),
            ],
          ),
        )
      ],
    );
  }
}

/**
 * 网格视图
 */
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key key}) : super(key: key);

  List<Widget> _generateTiles(length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text('item ${index}', style: TextStyle(color: Colors.black54)),
      );
    });
  }

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(posts[index].title, style: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.bold)),
              Text(posts[index].author, style: TextStyle(fontSize: 12.0, color: Colors.black45)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisCount: 3,
    //   mainAxisSpacing: 16.0,
    //   crossAxisSpacing: 16.0,
    //   children: _generateTiles(100),
    // );

    // return GridView.extent(
    //   maxCrossAxisExtent: 100.0,
    //   mainAxisSpacing: 16.0,
    //   crossAxisSpacing: 16.0,
    //   children: _generateTiles(100),
    // );

    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,  // 纵轴显示个数
        mainAxisSpacing: 16.0,  // 主轴间距
        crossAxisSpacing: 16.0, // 纵轴间距
        childAspectRatio: 1 / 1,  // 宽高比
      ),
    );
  }
}


// 基础功能 Widgets
// class BasicDemo extends TextDemo {}
// class BasicDemo extends RichTextDeom {}
// class BasicDemo extends ContainerDemo {}

// 布局 Widgets
// class BasicDemo extends ConstrainedBoxDemo {}
// class BasicDemo extends AspectRatioDemo {}
// class BasicDemo extends FexlDemo {}
// class BasicDemo extends StackDeom {}

// PageView Widgets
// class BasicDemo extends PageViewDemo {}
class BasicDemo extends GridViewDemo {}
