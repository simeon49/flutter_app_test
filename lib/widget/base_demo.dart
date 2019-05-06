/**
 * 基本练习
 */
import 'package:flutter/material.dart';

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


// class BasicDemo extends TextDemo {}
// class BasicDemo extends RichTextDeom {}
class BasicDemo extends ContainerDemo {}
// class BasicDemo extends TextDemo {}
// class BasicDemo extends TextDemo {}
