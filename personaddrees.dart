import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PersonData extends StatefulWidget {
  const PersonData({Key? key}) : super(key: key);

  @override
  State<PersonData> createState() => _personDataState();
}

class _personDataState extends State<PersonData> {
  final url = "https://jsonplaceholder.typicode.com/users";
  List posts = [];

  Future getPosts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        posts = jsonDecode(response.body);
      });
      print(posts);
    }
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PersonData"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.teal,
            child: Column(
              children: [
                Text((posts[index]["name"])),
                Text((posts[index]["email"])),
                Text((posts[index]["adress"].toString())),
              ],
            ),
          );
        },
        itemCount: posts.length,
        //itemCount: 10),),
      ),
    );
  }
}
