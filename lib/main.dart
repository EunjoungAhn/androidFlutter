import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 앱이 실행될때는 상태가 변경이 없기 때문에 StatelessWidget으로 감싸져있다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '경기 점수 카운트'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int count1 = 0;
  int count2 = 0;
  String vicTeam = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(height: 50,),
          Text("경기", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Container(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("상대"),
              Text("나"),
            ],
          ),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$count1점", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Text("$count2점", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          ),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                     setState(() {
                       count1 = count1 + 1;
                       if(count1 > 10){
                         vicTeam = "승리";
                       }
                     });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        count1 = count1 - 1;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        count2 = count2 + 1;
                        if(count2 > 10){
                          vicTeam = "승리";
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        count2 = count2 - 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(height: 20,),
          Text(vicTeam, style: TextStyle(fontSize: 50, color: Colors.green),)
        ],
      ),
    );
  }
}
