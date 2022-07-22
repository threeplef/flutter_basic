import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/future_builder/post_data.dart';
import 'package:untitled/future_builder/post.dart';

class FutureBuilderTest extends StatelessWidget {
  const FutureBuilderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Post>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('에러가 발생했습니다'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text('데이터가 없습니다'),
              );
            }

            final postData = snapshot.data!;

            if (postData.isEmpty) {
              return const Center(
                child: Text('데이터가 0개입니다'),
              );
            }

            return ListView.builder(
              itemCount: postData.length,
              itemBuilder: (BuildContext context, int index) {
                Post item = postData[index];
                return ListTile(
                  title: Text(item.title),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));

    String jsonString = postData;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List posts = json['posts'];
    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
