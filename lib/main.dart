import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _idx = 0;

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
      body: Center(
        child: Column(
          // Column is also 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // 텍스트 버튼 말고도 특정 무언가를 클릭하고 싶을때 사용.
            // 감싸는 위젯은 항상 무엇을 감싸는지 child로 알려주어야 한다.
            InkWell(
              child: Icon(Icons.add),
              onTap:() {
                print("클릭 효과가 있는 클릭!");
              },
            ),
            GestureDetector(
              child: Icon(Icons.add),
              onTap:() {
                print("클릭 효과가 없이 클릭됨!");
              },
            ),
            Container(child: Text("컨테이너 안"), color: Colors.redAccent,),
            TextButton(onPressed: () {
              print("텍스트 눌림!");
            },
                child: Text("텍스트 눌림!"),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB 눌림!");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
        bottomNavigationBar: BottomNavigationBar(
          // items 안에 있기에 두개 이상이 등록되어야 에러가 없다.
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "홈"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more),
                  label: "더보기탭"
              )
            ],
          // bottomNavigationBar에서 해당 Item을 클릭하면 index을 알 수 있다.
          onTap: (index){
              setState(() { // 플러터는 바뀐다는 것을 알려주어야 한다.
                print(index);
                // 탭이 눌린 index로 바꾸어 주기
                _idx = index;
              });
          },
          currentIndex: _idx,
        ),
    );
  }
}
