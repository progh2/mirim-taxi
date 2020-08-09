import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final dummyItems = [
  'https://www.e-mirim.hs.kr/upload/board/1594343071091.JPG',
  'https://www.e-mirim.hs.kr/upload/board/1594343071094.JPG',
  'https://www.e-mirim.hs.kr/upload/board/1594343071098.JPG',
  'https://www.e-mirim.hs.kr/upload/board/1594343071100.JPG',
  'https://www.e-mirim.hs.kr/upload/board/1594343071104.JPG',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; // 페이지 인덱스
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('복잡한 UI', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('홈'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title: Text('이용서비스'), icon: Icon(Icons.assignment)),
          BottomNavigationBarItem(
            title: Text('내 정보'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('첫번째 행의 첫번째 아이콘 클릭!');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('기본 택시'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('첫번째 행의 두번째 아이콘 클릭');
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('전기 택시'),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('시외 택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('모범 택시'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('기본 택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('전기 택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.local_taxi, size: 40),
                  Text('시외 택시'),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('모범 택시'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
      ),
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.black12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(url, fit: BoxFit.cover),
                ));
          },
        );
      }).toList(),
    );
  }

  _buildBottom() {
    return Text('Bottom');
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          '페이지2',
          style: TextStyle(fontSize: 40),
        ));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          '페이지3',
          style: TextStyle(fontSize: 40),
        ));
  }
}
