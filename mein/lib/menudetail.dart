

import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

class MenuDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuDetailPage(),
    );
  }
}

class MenuDetailPage extends StatefulWidget{
  @override
  _MenuDetailState createState() =>_MenuDetailState();

}

class _MenuDetailState extends State<MenuDetailPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length : 2,
      child : Scaffold(
        appBar:AppBar(
        title: Text('menudetail')
        ),
         body: Column(
          children:<Widget>[
            imageSection,
            menuSection,
              // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(child: Text(
                      'Ingredient',
                      style : TextStyle(
                      fontFamily: "Sans",
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  )), 
                    Tab(child: Text(
                      'Review',
                      style : TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  )), 
                  ],
                ),
              ),
            ),
             Expanded(
              child: TabBarView(
                children: [
                  Container(
                      height: 200,
                      child : ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children : <Widget>[Ingredientchart()]
                      )
                  ),
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  
            // devider,
            // restaurantSection
            ]
          ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    bottomNavigationBar: BottomNavigation(currentTab : 0),
    )
    );
  }
}

Widget imageSection = Container(
  height: 50,
  width: double.infinity,
  child:Image.asset('images/restaurant_sample.png',fit: BoxFit.cover),
);

Widget menuSection = Container(
  height: 300,
  padding: const EdgeInsets.all(36),
  child: Row(
    children: [
      Expanded(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[ 
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            child:Text(
              '전주 콩나물 국밥',
              style : TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 24.0
              )
            )
          ),
          Text(
            'steamed rice mixed with bean sprout soup',
            style : TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0
            )
          ),
          Container(
            margin: const EdgeInsets.all(12.0),
            child: Text(
              'Main Menu',
              style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0
              ),
            ),
          ),
          Container(
            child: Image.asset('images/kongnamulgookbab.png'),
          ),
          stars,
          Container(
          margin: const EdgeInsets.only(top:12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                child:Text(
                '#HOT',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child:Text(
                '#SALTY',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child:Text(
                '#VEGAN',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              )
            ]
          )
          )
        ]
      ))  
    ],
  ),
);

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ],
);

Widget restaurantSection = Container(
 padding: const EdgeInsets.all(36),
  child: Row(
    children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: const EdgeInsets.only(bottom:12.0),
            child:Text(
              'This restaurant is ...',
              style : TextStyle(
                 fontWeight: FontWeight.normal,
                 fontSize: 16.0
              )
            )
          ),
          stars,
          Container(
            margin: const EdgeInsets.only(top:12.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                child :Text(
                  '#Cheap',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                  )
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child :Text(
                  '#Delicious',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                )
              )),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child :Text(
                  '#Kind',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                )
              ))
            ]
          )
          )
        ]
      )
      )
    ]
  )
);

Widget ingredientView = Container(
  height: 200,
  child : ListView(
  shrinkWrap: true,
  scrollDirection: Axis.horizontal,
  children : <Widget>[Ingredientchart()]
  )
);

class Ingredientchart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<double> points = [99, 83, 
    // 27, 55, 9, 50, 70, 12
    ];

    List<String> labels = [ // 가로축에 적을 텍스트(레이블)
      "Seafood",
      "tofu",
      // "Anchovy Stock",
      // "papper",
      // "egg",
      // "green onion",
      // "salt",
      // "crab"
    ];


    return Scaffold(
    body: Container(
      height: 200,
      // padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    height: 200,
                    child: CustomPaint(
                        size: Size(200, 200),
                        painter : BarChart(
                            data: points,
                            labels: labels,
                            color: Colors.pinkAccent
                            )
                            ), // color - 막대 그래프의 색깔
                  )
              ),
    ));
  
  }
}

class BarChart extends CustomPainter {
  Color color;
  List<double> data = [];
  List<String> labels = [];
  double bottomPadding = 0.0;
  double leftPadding = 0.0;

  BarChart({this.data, this.labels, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    
    List<Offset> coordinates = getCoordinates(size);

    drawBar(canvas, size, coordinates);
  }


  void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    double barWidthMargin = (size.height * 0.09); // 막대 그래프가 겹치지 않게 간격을 줌. 

    for (var index = 0; index < coordinates.length; index++) {
      Offset offset = coordinates[index];
      double left = offset.dx;
      double right = size.width - bottomPadding;  // 간격만큼 가로로 이동
      double top = offset.dy;
      double bottom = offset.dy + barWidthMargin;// 텍스트 크기만큼 패딩을 빼줘서, 텍스트와 겹치지 않게 함.  

      Rect rect = Rect.fromLTRB(right, top, left, bottom);
      canvas.drawRect(rect, paint);
    }
  }

  List<Offset> getCoordinates(Size size) {
    List<Offset> coordinates = [];

    double height = size.height - bottomPadding;
    double minBarHeight = height / data.length;

    for (var index = 0; index < data.length; index++) {
      double top = minBarHeight * (index) + bottomPadding; // 그래프의 가로 위치를 정합니다. 
      double normalized = data[index] / 100; // 그래프의 높이가 [0~1] 사이가 되도록 정규화 합니다.
      double height = size.height - bottomPadding; // x축에 표시되는 글자들과 겹치지 않게 높이에서 패딩을 제외합니다.
      double right = height - normalized * height; // 정규화된 값을 통해 높이를 구해줍니다. 

      Offset offset = Offset(top, right);
      coordinates.add(offset);
    }

    return coordinates;
  }

  @override
  bool shouldRepaint(BarChart old) {
    return old.data != data;
  }
}

Widget reviewView = Container(
  height: 2.0,
  // width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left:24.0,right: 24.0),
);

Widget reviewDetail = Container();


Widget devider = Container(
  height: 2.0,
  width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left:24.0,right: 24.0),
);