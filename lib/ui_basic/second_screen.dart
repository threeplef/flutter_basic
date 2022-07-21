import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  final String name;

  // 생성자
  const SecondScreen(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/flower.jpeg'),
            Text(name),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('이전 화면으로'),
            ),
          ],
        ),
      ),
    );
  }
}
