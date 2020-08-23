import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer; //타이머

  var _time = 0;  //0.1초마다 1씩 증가시킬 정수형 변수
  var _isRunning = false; //현재 시작 상태를 나타낼 불리언 변수

  List<String> _lapTime = []; //랩타임에 표시할 시간을 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('StopWatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> setState(() {
          _clickButton();
        }),
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody(){
    return Container(
      child: Padding(
        padding:const EdgeInsets.only(top:30),
        child: Stack(
          children: <Widget>[
            Column(
              children:<Widget>[
                Row(  //시간을 표시하는 영역
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text( //초
                      '0',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('00'), //1/100초
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  child: ListView(
                    children: <Widget>[], // TODO : 랩타임 추후 수정
                  )
                )
              ]
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrangeAccent,
                onPressed: (){}, //TODO : 왼쪽 아래 위치 초기화 버튼 동작 구현
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned( //오른쪽 아래에 위치한 랩타임 버튼
              right: 10,
              bottom: 10,
              child : RaisedButton(
                onPressed:(){}, //TODO: 오른 쪽 아래에 위치한 랩타임 버튼 동작 구현
                child: Text('랩타임')
              )
            )
          ]
        )
      )
    );
  }

  void _clickButton(){

  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
