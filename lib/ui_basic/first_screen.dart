// stless
import 'package:flutter/material.dart';
import 'package:untitled/ui_basic/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // 상태 (=변수)
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn.imweb.me/upload/S201807025b39d1981b0b0/16b98d3e3d30e.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (text) {
                  name = text;
                  print(text);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 일어나는 이벤트
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(name)),
                );
              },
              child: Text('다음 화면으로'),
            ),
          ],
        ),
      ),
    );
  }
}
